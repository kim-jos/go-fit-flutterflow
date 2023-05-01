// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';

class CalendarData {
  Future<List<DocumentSnapshot>> getReservations(
      DateTime start, DateTime end) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reservations')
        .where('startTime', isGreaterThanOrEqualTo: DateTime.now())
        .orderBy('startTime')
        .get();
    return snapshot.docs;
  }

  LinkedHashMap<DateTime, List<DocumentSnapshot>> groupReservationsByDate(
      List<DocumentSnapshot> reservations) {
    final LinkedHashMap<DateTime, List<DocumentSnapshot>> events =
        LinkedHashMap();

    reservations.forEach((reservation) {
      final DateTime classDate = reservation['startTime'].toDate();
      final DateTime date =
          DateTime(classDate.year, classDate.month, classDate.day);
      if (events[date] == null) {
        events[date] = [reservation];
      } else {
        events[date]!.add(reservation);
      }
    });
    print('joseph events: $events');
    return events;
  }
}

class MyReservationsCalendar extends StatefulWidget {
  const MyReservationsCalendar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _MyReservationsCalendarState createState() => _MyReservationsCalendarState();
}

class _MyReservationsCalendarState extends State<MyReservationsCalendar> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final User currentUser;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  LinkedHashMap<DateTime, List<DocumentSnapshot>> _groupedEvents =
      LinkedHashMap();
  final CalendarData _calendarData = CalendarData();

  @override
  void initState() {
    super.initState();
    currentUser = auth.currentUser!;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _firstDay =
        DateTime(_focusedDay.year, _focusedDay.month - 3, _focusedDay.day);
    _lastDay =
        DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day + 7);
    _fetchReservations();
  }

  void _fetchReservations() async {
    final reservations = await _calendarData.getReservations(
        _focusedDay, _focusedDay.add(Duration(days: 30)));
    final groupedEvents = _calendarData.groupReservationsByDate(reservations);
    setState(() {
      _groupedEvents = groupedEvents;
    });
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: _firstDay,
          lastDay: _lastDay,
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            selectedTextStyle: TextStyle(
              color: Colors.white,
            ),
            markersMaxCount: 1,
            markersAlignment: Alignment.bottomCenter,
            markerSizeScale: 0.5,
          ),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
          eventLoader: (day) {
            if (_groupedEvents.containsKey(day)) {
              return [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                )
              ];
            } else {
              return [];
            }
          },
        ),
      ],
    );
  }
}
