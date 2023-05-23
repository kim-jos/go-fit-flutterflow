import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HomeRecord extends FirestoreRecord {
  HomeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "classesRef" field.
  List<DocumentReference>? _classesRef;
  List<DocumentReference> get classesRef => _classesRef ?? const [];
  bool hasClassesRef() => _classesRef != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _classesRef = getDataList(snapshotData['classesRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('home');

  static Stream<HomeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HomeRecord.fromSnapshot(s));

  static Future<HomeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HomeRecord.fromSnapshot(s));

  static HomeRecord fromSnapshot(DocumentSnapshot snapshot) => HomeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HomeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HomeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HomeRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createHomeRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}
