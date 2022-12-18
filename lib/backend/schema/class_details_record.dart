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
    ..instagram = '';

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
        ..instagram = instagram,
    ),
  );

  return firestoreData;
}
