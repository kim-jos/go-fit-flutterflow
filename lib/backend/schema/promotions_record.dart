import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promotions_record.g.dart';

abstract class PromotionsRecord
    implements Built<PromotionsRecord, PromotionsRecordBuilder> {
  static Serializer<PromotionsRecord> get serializer =>
      _$promotionsRecordSerializer;

  int? get friendReferral;

  int? get signUpEvent;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromotionsRecordBuilder builder) => builder
    ..friendReferral = 0
    ..signUpEvent = 0;

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
  int? friendReferral,
  int? signUpEvent,
}) {
  final firestoreData = serializers.toFirestore(
    PromotionsRecord.serializer,
    PromotionsRecord(
      (p) => p
        ..friendReferral = friendReferral
        ..signUpEvent = signUpEvent,
    ),
  );

  return firestoreData;
}
