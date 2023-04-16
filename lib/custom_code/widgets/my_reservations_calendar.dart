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
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final User currentUser;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late dynamic _allReservations = [];

  @override
  void initState() {
    super.initState();
    currentUser = auth.currentUser!;
    _focusedDay = DateTime.now();
    _firstDay =
        DateTime(_focusedDay.year, _focusedDay.month - 3, _focusedDay.day);
    _lastDay =
        DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day + 7);
    _getAllReservations();
  }

  Future<void> _getAllReservations() async {
    final reservations = FirebaseFirestore.instance
        .collection('reservations')
        .where('user', isEqualTo: currentUser.uid);

    final querySnapshot = await reservations.get();
    setState(() {
      _allReservations = querySnapshot;
      print('thisis the reservations list $_allReservations');
      querySnapshot.docs.map((doc) => print(doc.data().toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: _firstDay,
          lastDay: _lastDay, // seven days in the future
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: false,
          ),
          onDaySelected: (selectedDay, focusedDay) {
            print('this is all reservations $_allReservations');
            _allReservations.map((doc) => {print(doc)});
            setState(() {
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
        ),
      ],
    );
  }
}
