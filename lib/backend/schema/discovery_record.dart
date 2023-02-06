import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'discovery_record.g.dart';

abstract class DiscoveryRecord
    implements Built<DiscoveryRecord, DiscoveryRecordBuilder> {
  static Serializer<DiscoveryRecord> get serializer =>
      _$discoveryRecordSerializer;

  @BuiltValueField(wireName: 'content_url')
  BuiltList<String>? get contentUrl;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'thumbnail_url')
  String? get thumbnailUrl;

  String? get title;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DiscoveryRecordBuilder builder) => builder
    ..contentUrl = ListBuilder()
    ..thumbnailUrl = ''
    ..title = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Discovery');

  static Stream<DiscoveryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DiscoveryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DiscoveryRecord._();
  factory DiscoveryRecord([void Function(DiscoveryRecordBuilder) updates]) =
      _$DiscoveryRecord;

  static DiscoveryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDiscoveryRecordData({
  DateTime? createdAt,
  String? thumbnailUrl,
  String? title,
}) {
  final firestoreData = serializers.toFirestore(
    DiscoveryRecord.serializer,
    DiscoveryRecord(
      (d) => d
        ..contentUrl = null
        ..createdAt = createdAt
        ..thumbnailUrl = thumbnailUrl
        ..title = title,
    ),
  );

  return firestoreData;
}
