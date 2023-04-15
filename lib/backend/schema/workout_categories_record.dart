import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'workout_categories_record.g.dart';

abstract class WorkoutCategoriesRecord
    implements Built<WorkoutCategoriesRecord, WorkoutCategoriesRecordBuilder> {
  static Serializer<WorkoutCategoriesRecord> get serializer =>
      _$workoutCategoriesRecordSerializer;

  int? get priority;

  String? get category;

  String? get imageUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WorkoutCategoriesRecordBuilder builder) =>
      builder
        ..priority = 0
        ..category = ''
        ..imageUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workoutCategories');

  static Stream<WorkoutCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WorkoutCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WorkoutCategoriesRecord._();
  factory WorkoutCategoriesRecord(
          [void Function(WorkoutCategoriesRecordBuilder) updates]) =
      _$WorkoutCategoriesRecord;

  static WorkoutCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWorkoutCategoriesRecordData({
  int? priority,
  String? category,
  String? imageUrl,
}) {
  final firestoreData = serializers.toFirestore(
    WorkoutCategoriesRecord.serializer,
    WorkoutCategoriesRecord(
      (w) => w
        ..priority = priority
        ..category = category
        ..imageUrl = imageUrl,
    ),
  );

  return firestoreData;
}
