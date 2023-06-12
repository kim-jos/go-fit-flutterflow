import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentHistoryRecord extends FirestoreRecord {
  PaymentHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "companyRef" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "validDays" field.
  int? _validDays;
  int get validDays => _validDays ?? 0;
  bool hasValidDays() => _validDays != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _companyRef = snapshotData['companyRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _validDays = snapshotData['validDays'] as int?;
    _amount = snapshotData['amount'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paymentHistory');

  static Stream<PaymentHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentHistoryRecord.fromSnapshot(s));

  static Future<PaymentHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentHistoryRecord.fromSnapshot(s));

  static PaymentHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentHistoryRecordData({
  DocumentReference? userRef,
  DocumentReference? companyRef,
  DateTime? createdAt,
  int? validDays,
  int? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'companyRef': companyRef,
      'createdAt': createdAt,
      'validDays': validDays,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}
