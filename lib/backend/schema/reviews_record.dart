import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "reservationRef" field.
  DocumentReference? _reservationRef;
  DocumentReference? get reservationRef => _reservationRef;
  bool hasReservationRef() => _reservationRef != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _classRef = snapshotData['classRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _review = snapshotData['review'] as String?;
    _rating = snapshotData['rating'] as int?;
    _reservationRef = snapshotData['reservationRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? userRef,
  DocumentReference? classRef,
  DateTime? createdAt,
  String? review,
  int? rating,
  DocumentReference? reservationRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'classRef': classRef,
      'createdAt': createdAt,
      'review': review,
      'rating': rating,
      'reservationRef': reservationRef,
    }.withoutNulls,
  );

  return firestoreData;
}
