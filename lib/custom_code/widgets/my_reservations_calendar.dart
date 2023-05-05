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

import 'index.dart'; // Imports other custom widgets

import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';

class CalendarData {
  Future<List<DocumentSnapshot>> getReservations(userRef) async {
    final userRefFinal =
        FirebaseFirestore.instance.collection('users').doc(userRef.uid);

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reservations')
        .where('user', isEqualTo: userRefFinal)
        // .orderBy('startTime', descending: true)
        .get();
    dynamic docss = snapshot.docs.map((e) => print(e.get('className')));
    print('fireabse: $docss');
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _currentUser;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  LinkedHashMap<DateTime, List<DocumentSnapshot>> _groupedEvents =
      LinkedHashMap(); // maintains the events grouped by date
  final CalendarData _calendarData =
      CalendarData(); // helper class for fetching and grouping events

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser!;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _firstDay = DateTime(_focusedDay.year, _focusedDay.month - 3,
        _focusedDay.day); // 3 months before current month
    _lastDay = DateTime(_focusedDay.year, _focusedDay.month,
        _focusedDay.day + 7); // 7 days after current day
    _fetchReservations(); // fetch reservations for the current month
  }

  // fetches the reservations for the current month and groups them by date
  _fetchReservations() async {
    final reservations = await _calendarData.getReservations(
        _currentUser); // get reservations for the current month
    final groupedEvents = _calendarData
        .groupReservationsByDate(reservations); // group reservations by date
    setState(() {
      _groupedEvents =
          groupedEvents; // update the state with the grouped events
    });
    return _groupedEvents;
  }

  // builds the markers to show on each day with events
  List<Widget> _buildEventsMarker(DateTime date,
      LinkedHashMap<DateTime, List<DocumentSnapshot>> groupedEvents) {
    print('groude event: $groupedEvents');
    List<Widget> markers = [];

    if (groupedEvents.containsKey(date)) {
      markers.add(
        Positioned(
          bottom: 1,
          child: Container(
            width: 2,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
    return markers;
  }

  List _getEventsForDay(DateTime day) {
    print('day $day');
    final days = _groupedEvents[day];
    print('get event for day: $days');
    return _groupedEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _fetchReservations(),
      builder: (context, snapshot) {
        dynamic data = snapshot.data;
        if (snapshot.hasData) {
          print('snapshot data: $data');

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  firstDay: _firstDay,
                  lastDay: _lastDay,
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    weekendTextStyle: TextStyle().copyWith(color: Colors.black),
                    todayTextStyle: TextStyle().copyWith(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    markersMaxCount: 1,
                    markersAlignment: Alignment.bottomCenter,
                    markerSizeScale: 0.5,
                  ),
                  eventLoader: (day) {
                    return _getEventsForDay(day);
                  },
                )
              ],
            ),
          );
        } else {
          print('there is not data');
          return Container();
        }
      },
    ));
  }
}
