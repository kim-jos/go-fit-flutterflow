import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'home_record.g.dart';

abstract class HomeRecord implements Built<HomeRecord, HomeRecordBuilder> {
  static Serializer<HomeRecord> get serializer => _$homeRecordSerializer;

  String? get videoUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(HomeRecordBuilder builder) =>
      builder..videoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('home');

  static Stream<HomeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<HomeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  HomeRecord._();
  factory HomeRecord([void Function(HomeRecordBuilder) updates]) = _$HomeRecord;

  static HomeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createHomeRecordData({
  String? videoUrl,
}) {
  final firestoreData = serializers.toFirestore(
    HomeRecord.serializer,
    HomeRecord(
      (h) => h..videoUrl = videoUrl,
    ),
  );

  return firestoreData;
}
