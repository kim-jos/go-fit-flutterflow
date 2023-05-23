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

import 'dart:collection';

// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:table_calendar/table_calendar.dart';

class MyReservationsCalendar extends StatefulWidget {
  const MyReservationsCalendar({
    Key? key,
    this.width,
    this.height,
    this.allReservations,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<ReservationsRecord>? allReservations;

  @override
  _MyReservationsCalendarState createState() => _MyReservationsCalendarState();
}

class _MyReservationsCalendarState extends State<MyReservationsCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  LinkedHashMap<DateTime, List<ReservationsRecord>> _groupedEvents =
      LinkedHashMap();

  @override
  void initState() {
    super.initState();
    _focusedDay =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _selectedDay = DateTime.now();
    _firstDay = DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
    _lastDay =
        DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day + 7);
    FFAppState().reservationDate = _focusedDay;
    groupReservationsByDate(widget.allReservations ?? []);
  }

  LinkedHashMap<DateTime, List<ReservationsRecord>> groupReservationsByDate(
      List<ReservationsRecord> reservations) {
    final LinkedHashMap<DateTime, List<ReservationsRecord>> events =
        LinkedHashMap();

    reservations.forEach((reservation) {
      final DateTime? classDate = reservation.startTime;
      final DateTime date =
          DateTime.utc(classDate!.year, classDate.month, classDate.day);
      if (events[date] == null) {
        events[date] = [reservation];
      } else {
        events[date]!.add(reservation);
      }
    });

    setState(() {
      _groupedEvents = events;
    });
    return events;
  }

  List<Widget> _buildEventsMarker(DateTime date,
      LinkedHashMap<DateTime, List<ReservationsRecord>> groupedEvents) {
    List<Widget> markers = [];

    if (groupedEvents.containsKey(date)) {
      List<ReservationsRecord>? reservations = groupedEvents[date];
      for (int i = 0; i < reservations!.length; i++) {
        markers.add(
          Container(),
        );
      }
    }

    return markers;
  }

  // convertToJson(List<ReservationsRecord> reservationCollection) {
  //   return reservationCollection
  //       .map((e) => {
  //             'date': e.date,
  //             'timeSlot': e.timeSlot,
  //             'user': e.user,
  //             'classRequiredCredits': e.classRequiredCredits,
  //             'className': e.className,
  //             'time': e.time,
  //             'createdAt': e.createdAt,
  //             'isFinal': e.isFinal,
  //             'startTime': DateFormat.yMMMd().format(e.startTime!),
  //           })
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            locale: 'ko_KR',
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                if (_groupedEvents[focusedDay] != null) {
                  FFAppState().reservationDate = _focusedDay;
                } else {
                  FFAppState().reservationDate = DateTime.utc(
                      focusedDay.year, focusedDay.month, focusedDay.day);
                }
                FFAppState().update(() {});
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
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
              markersMaxCount: 10,
              markersAlignment: Alignment.bottomCenter,
              markerSizeScale: 0.2,
              markerDecoration: BoxDecoration(
                  color: Colors.greenAccent[400], shape: BoxShape.circle),
            ),
            eventLoader: (day) {
              DateTime date = DateTime.utc(day.year, day.month, day.day);
              return _buildEventsMarker(date, _groupedEvents);
            },
          )
        ],
      ),
    );
  }
}
