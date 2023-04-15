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
  late final CalendarController _controller;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late List<Map<String, dynamic>> _reservations;

  Future<List<Map<String, dynamic>>> _fetchReservations(DateTime day) async {
    final reservations = FirebaseFirestore.instance
        .collection('reservations')
        .where('startTime', isGreaterThanOrEqualTo: _firstDay)
        .where('startTime', isLessThanOrEqualTo: _lastDay);

    final snapshot = await reservations.get();
    final docs = snapshot.docs;

    final reservationsForDay = docs
        .where((doc) {
          final startTime = doc['startTime'].toDate();
          return startTime.day == day.day &&
              startTime.month == day.month &&
              startTime.year == day.year;
        })
        .map((doc) => doc.data())
        .toList();

    return reservationsForDay;
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _controller = CalendarController();
    _firstDay =
        DateTime(_focusedDay.year, _focusedDay.month - 3, _focusedDay.day);
    _lastDay =
        DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day + 7);
    _reservations = [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          calendarController: _controller,
          firstDay: _firstDay,
          lastDay: _lastDay,
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          eventLoader: (day) async {
            final reservationsForDay = await _fetchReservations(day);
            return reservationsForDay.isNotEmpty ? reservationsForDay : null;
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
            _firstDay = DateTime(
                _focusedDay.year, _focusedDay.month - 3, _focusedDay.day);
            _lastDay = DateTime(
                _focusedDay.year, _focusedDay.month, _focusedDay.day + 7);
          },
          onDaySelected: (selectedDay, focusedDay) async {
            final reservationsForDay = await _fetchReservations(selectedDay);
            setState(() {
              _reservations = reservationsForDay;
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _reservations.length,
            itemBuilder: (context, index) {
              final reservation = _reservations[index];
              return ListTile(
                title: Text(reservation['className']),
                subtitle: Text(
                  '${reservation['startTime'].toDate().toString()}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
