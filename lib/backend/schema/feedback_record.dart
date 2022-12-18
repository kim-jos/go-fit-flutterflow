import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'feedback_record.g.dart';

abstract class FeedbackRecord
    implements Built<FeedbackRecord, FeedbackRecordBuilder> {
  static Serializer<FeedbackRecord> get serializer =>
      _$feedbackRecordSerializer;

  DocumentReference? get userRef;

  String? get message;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FeedbackRecordBuilder builder) =>
      builder..message = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FeedbackRecord._();
  factory FeedbackRecord([void Function(FeedbackRecordBuilder) updates]) =
      _$FeedbackRecord;

  static FeedbackRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFeedbackRecordData({
  DocumentReference? userRef,
  String? message,
}) {
  final firestoreData = serializers.toFirestore(
    FeedbackRecord.serializer,
    FeedbackRecord(
      (f) => f
        ..userRef = userRef
        ..message = message,
    ),
  );

  return firestoreData;
}
