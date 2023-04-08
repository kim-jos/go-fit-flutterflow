import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'classes_record.g.dart';

abstract class ClassesRecord
    implements Built<ClassesRecord, ClassesRecordBuilder> {
  static Serializer<ClassesRecord> get serializer => _$classesRecordSerializer;

  String? get name;

  String? get image;

  String? get exerciseType;

  int? get priority;

  String? get distance;

  bool? get hideClass;

  int? get ratings;

  LatLng? get coords;

  bool? get isPopular;

  int? get creditsRequired;

  String? get paymentUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ClassesRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..exerciseType = ''
    ..priority = 0
    ..distance = ''
    ..hideClass = false
    ..ratings = 0
    ..isPopular = false
    ..creditsRequired = 0
    ..paymentUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classes');

  static Stream<ClassesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ClassesRecord._();
  factory ClassesRecord([void Function(ClassesRecordBuilder) updates]) =
      _$ClassesRecord;

  static ClassesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createClassesRecordData({
  String? name,
  String? image,
  String? exerciseType,
  int? priority,
  String? distance,
  bool? hideClass,
  int? ratings,
  LatLng? coords,
  bool? isPopular,
  int? creditsRequired,
  String? paymentUrl,
}) {
  final firestoreData = serializers.toFirestore(
    ClassesRecord.serializer,
    ClassesRecord(
      (c) => c
        ..name = name
        ..image = image
        ..exerciseType = exerciseType
        ..priority = priority
        ..distance = distance
        ..hideClass = hideClass
        ..ratings = ratings
        ..coords = coords
        ..isPopular = isPopular
        ..creditsRequired = creditsRequired
        ..paymentUrl = paymentUrl,
    ),
  );

  return firestoreData;
}
