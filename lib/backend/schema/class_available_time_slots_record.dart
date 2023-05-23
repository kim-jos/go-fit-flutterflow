import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassAvailableTimeSlotsRecord extends FirestoreRecord {
  ClassAvailableTimeSlotsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "minHoursBeforeClass" field.
  int? _minHoursBeforeClass;
  int get minHoursBeforeClass => _minHoursBeforeClass ?? 0;
  bool hasMinHoursBeforeClass() => _minHoursBeforeClass != null;

  // "maxHoursBeforeClass" field.
  int? _maxHoursBeforeClass;
  int get maxHoursBeforeClass => _maxHoursBeforeClass ?? 0;
  bool hasMaxHoursBeforeClass() => _maxHoursBeforeClass != null;

  // "reservations" field.
  List<DocumentReference>? _reservations;
  List<DocumentReference> get reservations => _reservations ?? const [];
  bool hasReservations() => _reservations != null;

  // "maxLimit" field.
  int? _maxLimit;
  int get maxLimit => _maxLimit ?? 0;
  bool hasMaxLimit() => _maxLimit != null;

  // "minHoursToCancel" field.
  int? _minHoursToCancel;
  int get minHoursToCancel => _minHoursToCancel ?? 0;
  bool hasMinHoursToCancel() => _minHoursToCancel != null;

  // "creditsRequired" field.
  int? _creditsRequired;
  int get creditsRequired => _creditsRequired ?? 0;
  bool hasCreditsRequired() => _creditsRequired != null;

  // "weekdays" field.
  List<int>? _weekdays;
  List<int> get weekdays => _weekdays ?? const [];
  bool hasWeekdays() => _weekdays != null;

  void _initializeFields() {
    _classRef = snapshotData['classRef'] as DocumentReference?;
    _startTime = snapshotData['startTime'] as String?;
    _endTime = snapshotData['endTime'] as String?;
    _minHoursBeforeClass = snapshotData['minHoursBeforeClass'] as int?;
    _maxHoursBeforeClass = snapshotData['maxHoursBeforeClass'] as int?;
    _reservations = getDataList(snapshotData['reservations']);
    _maxLimit = snapshotData['maxLimit'] as int?;
    _minHoursToCancel = snapshotData['minHoursToCancel'] as int?;
    _creditsRequired = snapshotData['creditsRequired'] as int?;
    _weekdays = getDataList(snapshotData['weekdays']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classAvailableTimeSlots');

  static Stream<ClassAvailableTimeSlotsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ClassAvailableTimeSlotsRecord.fromSnapshot(s));

  static Future<ClassAvailableTimeSlotsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ClassAvailableTimeSlotsRecord.fromSnapshot(s));

  static ClassAvailableTimeSlotsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ClassAvailableTimeSlotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassAvailableTimeSlotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassAvailableTimeSlotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassAvailableTimeSlotsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createClassAvailableTimeSlotsRecordData({
  DocumentReference? classRef,
  String? startTime,
  String? endTime,
  int? minHoursBeforeClass,
  int? maxHoursBeforeClass,
  int? maxLimit,
  int? minHoursToCancel,
  int? creditsRequired,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'classRef': classRef,
      'startTime': startTime,
      'endTime': endTime,
      'minHoursBeforeClass': minHoursBeforeClass,
      'maxHoursBeforeClass': maxHoursBeforeClass,
      'maxLimit': maxLimit,
      'minHoursToCancel': minHoursToCancel,
      'creditsRequired': creditsRequired,
    }.withoutNulls,
  );

  return firestoreData;
}
