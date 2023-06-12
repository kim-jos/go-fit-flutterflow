import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

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
  DateTime currTime = DateTime.now();

  try {
    DateTime tempDate = DateFormat('yMd').parse(yMdFormatString);
    DateTime date = DateTime.parse(
        DateFormat("yyyy-MM-dd").format(tempDate) + " " + timeString + ":00");
    return currTime.isBefore(date);
  } catch (e) {
    return false;
  }
}

DateTime dateAndTimeStringParser(
  String dateString,
  String timeString,
) {
  DateTime tempDate = DateFormat("yMd").parse(dateString);

  return DateTime.parse(
      DateFormat("yyyy-MM-dd").format(tempDate) + " " + timeString + ":00");
}

int convertWeekDayToInteger(DateTime date) {
  return date.weekday;
}

DateTime addDaysToCurrentTime(int days) {
  // add days to currentTime as much as the inserted argument
  return DateTime.now().add(Duration(days: days));
}

DateTime stripTimeFromDate(DateTime dateTimeWithTime) {
  print(DateTime.utc(
      dateTimeWithTime.year, dateTimeWithTime.month, dateTimeWithTime.day));
  return DateTime.utc(
      dateTimeWithTime.year, dateTimeWithTime.month, dateTimeWithTime.day);
}

bool emailValidator(
  String companyEmail,
  String inputEmail,
) {
  // use regex to check whether the inputEmail contains the companyemail
  print('company email: $companyEmail');
  print('input email: $inputEmail');
  RegExp regExp = RegExp(r'^[a-zA-Z0-9.]+@$companyEmail');
  return regExp.hasMatch(inputEmail);
}

DateTime addDaysToDate(
  DateTime date,
  int days,
) {
  // add days to date
  return date.add(Duration(days: days));
}
