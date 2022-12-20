import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

DateTime dateTimeParser(
  String stringDateTime,
  DateTime date,
) {
  return DateTime.parse(
      DateFormat("yyyy-MM-dd").format(date) + " " + stringDateTime + ":00");
}

int differenceInHours(
  DateTime dateTime1,
  DateTime dateTime2,
) {
  // diffence in datetime in hours
  return dateTime2.difference(dateTime1).inMinutes ~/ 60;
}

bool? showClass(
  String yMdFormatString,
  String timeString,
) {
  DateTime tempDate = new DateFormat("yMd").parse(yMdFormatString);
  DateTime date = DateTime.parse(
      DateFormat("yyyy-MM-dd").format(tempDate) + " " + timeString + ":00");
  DateTime currTime = DateTime.now();

  return currTime.isBefore(date);
}

DateTime dateAndTimeStringParser(
  String dateString,
  String timeString,
) {
  DateTime tempDate = new DateFormat("yMd").parse(dateString);

  DateTime date = DateTime.parse(
      DateFormat("yyyy-MM-dd").format(tempDate) + " " + timeString + ":00");
  print("full date should work: $date");

  return date;
}
