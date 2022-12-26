import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'memberships_record.g.dart';

abstract class MembershipsRecord
    implements Built<MembershipsRecord, MembershipsRecordBuilder> {
  static Serializer<MembershipsRecord> get serializer =>
      _$membershipsRecordSerializer;

  String? get title;

  String? get description;

  int? get price;

  String? get paymentUrl;

  int? get creditsIssued;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MembershipsRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..price = 0
    ..paymentUrl = ''
    ..creditsIssued = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('memberships');

  static Stream<MembershipsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MembershipsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MembershipsRecord._();
  factory MembershipsRecord([void Function(MembershipsRecordBuilder) updates]) =
      _$MembershipsRecord;

  static MembershipsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMembershipsRecordData({
  String? title,
  String? description,
  int? price,
  String? paymentUrl,
  int? creditsIssued,
}) {
  final firestoreData = serializers.toFirestore(
    MembershipsRecord.serializer,
    MembershipsRecord(
      (m) => m
        ..title = title
        ..description = description
        ..price = price
        ..paymentUrl = paymentUrl
        ..creditsIssued = creditsIssued,
    ),
  );

  return firestoreData;
}
