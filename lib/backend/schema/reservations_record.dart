import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "timeSlot" field.
  DocumentReference? _timeSlot;
  DocumentReference? get timeSlot => _timeSlot;
  bool hasTimeSlot() => _timeSlot != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "classRequiredCredits" field.
  int? _classRequiredCredits;
  int get classRequiredCredits => _classRequiredCredits ?? 0;
  bool hasClassRequiredCredits() => _classRequiredCredits != null;

  // "className" field.
  String? _className;
  String get className => _className ?? '';
  bool hasClassName() => _className != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "isFinal" field.
  bool? _isFinal;
  bool get isFinal => _isFinal ?? false;
  bool hasIsFinal() => _isFinal != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  void _initializeFields() {
    _date = snapshotData['date'] as String?;
    _timeSlot = snapshotData['timeSlot'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _classRequiredCredits = snapshotData['classRequiredCredits'] as int?;
    _className = snapshotData['className'] as String?;
    _time = snapshotData['time'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _isFinal = snapshotData['isFinal'] as bool?;
    _startTime = snapshotData['startTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createReservationsRecordData({
  String? date,
  DocumentReference? timeSlot,
  DocumentReference? user,
  int? classRequiredCredits,
  String? className,
  String? time,
  DateTime? createdAt,
  bool? isFinal,
  DateTime? startTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'timeSlot': timeSlot,
      'user': user,
      'classRequiredCredits': classRequiredCredits,
      'className': className,
      'time': time,
      'createdAt': createdAt,
      'isFinal': isFinal,
      'startTime': startTime,
    }.withoutNulls,
  );

  return firestoreData;
}
