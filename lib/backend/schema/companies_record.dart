import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "totalCredits" field.
  int? _totalCredits;
  int get totalCredits => _totalCredits ?? 0;
  bool hasTotalCredits() => _totalCredits != null;

  // "membershipType" field.
  String? _membershipType;
  String get membershipType => _membershipType ?? '';
  bool hasMembershipType() => _membershipType != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "contractLengthInDays" field.
  int? _contractLengthInDays;
  int get contractLengthInDays => _contractLengthInDays ?? 0;
  bool hasContractLengthInDays() => _contractLengthInDays != null;

  // "remainingCredits" field.
  int? _remainingCredits;
  int get remainingCredits => _remainingCredits ?? 0;
  bool hasRemainingCredits() => _remainingCredits != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _totalCredits = snapshotData['totalCredits'] as int?;
    _membershipType = snapshotData['membershipType'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _contractLengthInDays = snapshotData['contractLengthInDays'] as int?;
    _remainingCredits = snapshotData['remainingCredits'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? name,
  String? email,
  int? totalCredits,
  String? membershipType,
  DateTime? startDate,
  int? contractLengthInDays,
  int? remainingCredits,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'totalCredits': totalCredits,
      'membershipType': membershipType,
      'startDate': startDate,
      'contractLengthInDays': contractLengthInDays,
      'remainingCredits': remainingCredits,
    }.withoutNulls,
  );

  return firestoreData;
}
