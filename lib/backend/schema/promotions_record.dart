import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionsRecord extends FirestoreRecord {
  PromotionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "shareContent" field.
  String? _shareContent;
  String get shareContent => _shareContent ?? '';
  bool hasShareContent() => _shareContent != null;

  // "contentImages" field.
  List<String>? _contentImages;
  List<String> get contentImages => _contentImages ?? const [];
  bool hasContentImages() => _contentImages != null;

  void _initializeFields() {
    _amount = snapshotData['amount'] as int?;
    _type = snapshotData['type'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _shareContent = snapshotData['shareContent'] as String?;
    _contentImages = getDataList(snapshotData['contentImages']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotions');

  static Stream<PromotionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionsRecord.fromSnapshot(s));

  static Future<PromotionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionsRecord.fromSnapshot(s));

  static PromotionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionsRecordData({
  int? amount,
  String? type,
  String? imageUrl,
  DateTime? createdAt,
  String? shareContent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'type': type,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'shareContent': shareContent,
    }.withoutNulls,
  );

  return firestoreData;
}
