import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'class_details_record.g.dart';

abstract class ClassDetailsRecord
    implements Built<ClassDetailsRecord, ClassDetailsRecordBuilder> {
  static Serializer<ClassDetailsRecord> get serializer =>
      _$classDetailsRecordSerializer;

  DocumentReference? get classRef;

  int? get monthlyLimit;

  String? get duration;

  String? get misc;

  String? get address;

  String? get website;

  String? get description;

  String? get requirements;

  LatLng? get latitude;

  String? get instagram;

  BuiltList<String>? get images;

  BuiltList<String>? get businessHours;

  BuiltList<String>? get info;

  int? get price;

  bool? get hasShower;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ClassDetailsRecordBuilder builder) => builder
    ..monthlyLimit = 0
    ..duration = ''
    ..misc = ''
    ..address = ''
    ..website = ''
    ..description = ''
    ..requirements = ''
    ..instagram = ''
    ..images = ListBuilder()
    ..businessHours = ListBuilder()
    ..info = ListBuilder()
    ..price = 0
    ..hasShower = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classDetails');

  static Stream<ClassDetailsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ClassDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ClassDetailsRecord._();
  factory ClassDetailsRecord(
          [void Function(ClassDetailsRecordBuilder) updates]) =
      _$ClassDetailsRecord;

  static ClassDetailsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createClassDetailsRecordData({
  DocumentReference? classRef,
  int? monthlyLimit,
  String? duration,
  String? misc,
  String? address,
  String? website,
  String? description,
  String? requirements,
  LatLng? latitude,
  String? instagram,
  int? price,
  bool? hasShower,
}) {
  final firestoreData = serializers.toFirestore(
    ClassDetailsRecord.serializer,
    ClassDetailsRecord(
      (c) => c
        ..classRef = classRef
        ..monthlyLimit = monthlyLimit
        ..duration = duration
        ..misc = misc
        ..address = address
        ..website = website
        ..description = description
        ..requirements = requirements
        ..latitude = latitude
        ..instagram = instagram
        ..images = null
        ..businessHours = null
        ..info = null
        ..price = price
        ..hasShower = hasShower,
    ),
  );

  return firestoreData;
}
