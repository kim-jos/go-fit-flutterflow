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

  static bool _shouldNotify = true;
  void _maybeNotifyListeners() {
    if (_shouldNotify) notifyListeners();
  }

  // Update FFAppState without notifying and rebuilding all widgets.
  static void updateSilently(VoidCallback callback) {
    try {
      _shouldNotify = false;
      callback();
    } finally {
      _shouldNotify = true;
    }
  }

  late SharedPreferences prefs;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _maybeNotifyListeners();
    _selectedDate = _value;
  }

  String _selectedTime = '';
  String get selectedTime => _selectedTime;
  set selectedTime(String _value) {
    _maybeNotifyListeners();
    _selectedTime = _value;
  }

  int _creditsRequired = 0;
  int get creditsRequired => _creditsRequired;
  set creditsRequired(int _value) {
    _maybeNotifyListeners();
    _creditsRequired = _value;
  }

  List<DocumentReference> _chatGroupMembers = [];
  List<DocumentReference> get chatGroupMembers => _chatGroupMembers;
  set chatGroupMembers(List<DocumentReference> _value) {
    _maybeNotifyListeners();
    _chatGroupMembers = _value;
  }

  void addToChatGroupMembers(DocumentReference _value) {
    _maybeNotifyListeners();
    _chatGroupMembers.add(_value);
  }

  void removeFromChatGroupMembers(DocumentReference _value) {
    _maybeNotifyListeners();
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
