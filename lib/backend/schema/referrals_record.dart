import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferralsRecord extends FirestoreRecord {
  ReferralsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "referralBy" field.
  DocumentReference? _referralBy;
  DocumentReference? get referralBy => _referralBy;
  bool hasReferralBy() => _referralBy != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _referralBy = snapshotData['referralBy'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('referrals');

  static Stream<ReferralsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReferralsRecord.fromSnapshot(s));

  static Future<ReferralsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReferralsRecord.fromSnapshot(s));

  static ReferralsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReferralsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReferralsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReferralsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReferralsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReferralsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReferralsRecordData({
  DateTime? createdAt,
  DocumentReference? referralBy,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'referralBy': referralBy,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}
