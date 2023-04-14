import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'workout_categories_record.g.dart';

abstract class WorkoutCategoriesRecord
    implements Built<WorkoutCategoriesRecord, WorkoutCategoriesRecordBuilder> {
  static Serializer<WorkoutCategoriesRecord> get serializer =>
      _$workoutCategoriesRecordSerializer;

  String? get ballet;

  String? get climbing;

  String? get crossfit;

  String? get dance;

  String? get martialArts;

  String? get pilates;

  String? get spinning;

  String? get squash;

  String? get yoga;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WorkoutCategoriesRecordBuilder builder) =>
      builder
        ..ballet = ''
        ..climbing = ''
        ..crossfit = ''
        ..dance = ''
        ..martialArts = ''
        ..pilates = ''
        ..spinning = ''
        ..squash = ''
        ..yoga = '';

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
  String? ballet,
  String? climbing,
  String? crossfit,
  String? dance,
  String? martialArts,
  String? pilates,
  String? spinning,
  String? squash,
  String? yoga,
}) {
  final firestoreData = serializers.toFirestore(
    WorkoutCategoriesRecord.serializer,
    WorkoutCategoriesRecord(
      (w) => w
        ..ballet = ballet
        ..climbing = climbing
        ..crossfit = crossfit
        ..dance = dance
        ..martialArts = martialArts
        ..pilates = pilates
        ..spinning = spinning
        ..squash = squash
        ..yoga = yoga,
    ),
  );

  return firestoreData;
}
