import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutCategoriesRecord extends FirestoreRecord {
  WorkoutCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "priority" field.
  int? _priority;
  int get priority => _priority ?? 0;
  bool hasPriority() => _priority != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _priority = snapshotData['priority'] as int?;
    _category = snapshotData['category'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workoutCategories');

  static Stream<WorkoutCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutCategoriesRecord.fromSnapshot(s));

  static Future<WorkoutCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WorkoutCategoriesRecord.fromSnapshot(s));

  static WorkoutCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createWorkoutCategoriesRecordData({
  int? priority,
  String? category,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'priority': priority,
      'category': category,
      'imageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}
