import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MembershipsRecord extends FirestoreRecord {
  MembershipsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  bool hasPoints() => _points != null;

  // "paymentUrl" field.
  String? _paymentUrl;
  String get paymentUrl => _paymentUrl ?? '';
  bool hasPaymentUrl() => _paymentUrl != null;

  void _initializeFields() {
    _price = snapshotData['price'] as int?;
    _points = snapshotData['points'] as int?;
    _paymentUrl = snapshotData['paymentUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memberships');

  static Stream<MembershipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MembershipsRecord.fromSnapshot(s));

  static Future<MembershipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MembershipsRecord.fromSnapshot(s));

  static MembershipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MembershipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MembershipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MembershipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MembershipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MembershipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMembershipsRecordData({
  int? price,
  int? points,
  String? paymentUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'points': points,
      'paymentUrl': paymentUrl,
    }.withoutNulls,
  );

  return firestoreData;
}
