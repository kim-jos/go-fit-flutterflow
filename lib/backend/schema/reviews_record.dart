import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reviews_record.g.dart';

abstract class ReviewsRecord
    implements Built<ReviewsRecord, ReviewsRecordBuilder> {
  static Serializer<ReviewsRecord> get serializer => _$reviewsRecordSerializer;

  DocumentReference? get userRef;

  DocumentReference? get classRef;

  DateTime? get createdAt;

  String? get review;

  int? get rating;

  DocumentReference? get reservationRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReviewsRecordBuilder builder) => builder
    ..review = ''
    ..rating = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReviewsRecord._();
  factory ReviewsRecord([void Function(ReviewsRecordBuilder) updates]) =
      _$ReviewsRecord;

  static ReviewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? userRef,
  DocumentReference? classRef,
  DateTime? createdAt,
  String? review,
  int? rating,
  DocumentReference? reservationRef,
}) {
  final firestoreData = serializers.toFirestore(
    ReviewsRecord.serializer,
    ReviewsRecord(
      (r) => r
        ..userRef = userRef
        ..classRef = classRef
        ..createdAt = createdAt
        ..review = review
        ..rating = rating
        ..reservationRef = reservationRef,
    ),
  );

  return firestoreData;
}
