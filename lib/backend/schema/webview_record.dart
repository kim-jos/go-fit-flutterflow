import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WebviewRecord extends FirestoreRecord {
  WebviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('webview');

  static Stream<WebviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WebviewRecord.fromSnapshot(s));

  static Future<WebviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WebviewRecord.fromSnapshot(s));

  static WebviewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WebviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WebviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WebviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WebviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WebviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWebviewRecordData({
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}
