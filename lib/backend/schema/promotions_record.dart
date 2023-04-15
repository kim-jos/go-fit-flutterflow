import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promotions_record.g.dart';

abstract class PromotionsRecord
    implements Built<PromotionsRecord, PromotionsRecordBuilder> {
  static Serializer<PromotionsRecord> get serializer =>
      _$promotionsRecordSerializer;

  int? get amount;

  String? get type;

  String? get imageUrl;

  DateTime? get createdAt;

  String? get shareContent;

  BuiltList<String>? get contentImages;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromotionsRecordBuilder builder) => builder
    ..amount = 0
    ..type = ''
    ..imageUrl = ''
    ..shareContent = ''
    ..contentImages = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotions');

  static Stream<PromotionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromotionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromotionsRecord._();
  factory PromotionsRecord([void Function(PromotionsRecordBuilder) updates]) =
      _$PromotionsRecord;

  static PromotionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromotionsRecordData({
  int? amount,
  String? type,
  String? imageUrl,
  DateTime? createdAt,
  String? shareContent,
}) {
  final firestoreData = serializers.toFirestore(
    PromotionsRecord.serializer,
    PromotionsRecord(
      (p) => p
        ..amount = amount
        ..type = type
        ..imageUrl = imageUrl
        ..createdAt = createdAt
        ..shareContent = shareContent
        ..contentImages = null,
    ),
  );

  return firestoreData;
}
