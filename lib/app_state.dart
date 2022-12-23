import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    notifyListeners();
    _selectedDate = _value;
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  set selectedTime(String _value) {
    notifyListeners();
    _selectedTime = _value;
  }

  int _creditsRequired = 0;
  int get creditsRequired => _creditsRequired;
  set creditsRequired(int _value) {
    notifyListeners();
    _creditsRequired = _value;
  }

  List<DocumentReference> _chatGroupMembers = [];
  List<DocumentReference> get chatGroupMembers => _chatGroupMembers;
  set chatGroupMembers(List<DocumentReference> _value) {
    notifyListeners();
    _chatGroupMembers = _value;
  }

  void addToChatGroupMembers(DocumentReference _value) {
    notifyListeners();
    _chatGroupMembers.add(_value);
  }

  void removeFromChatGroupMembers(DocumentReference _value) {
    notifyListeners();
    _chatGroupMembers.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
