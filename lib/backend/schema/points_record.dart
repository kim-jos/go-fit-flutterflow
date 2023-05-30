import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointsRecord extends FirestoreRecord {
  PointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _amount = snapshotData['amount'] as int?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('points');

  static Stream<PointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PointsRecord.fromSnapshot(s));

  static Future<PointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PointsRecord.fromSnapshot(s));

  static PointsRecord fromSnapshot(DocumentSnapshot snapshot) => PointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PointsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPointsRecordData({
  int? amount,
  DateTime? createdAt,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'createdAt': createdAt,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}
