import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reservations_record.g.dart';

abstract class ReservationsRecord
    implements Built<ReservationsRecord, ReservationsRecordBuilder> {
  static Serializer<ReservationsRecord> get serializer =>
      _$reservationsRecordSerializer;

  String? get date;

  DocumentReference? get timeSlot;

  DocumentReference? get user;

  int? get classRequiredCredits;

  String? get className;

  String? get time;

  DocumentReference? get chatsRef;

  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReservationsRecordBuilder builder) => builder
    ..date = ''
    ..classRequiredCredits = 0
    ..className = ''
    ..time = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReservationsRecord._();
  factory ReservationsRecord(
          [void Function(ReservationsRecordBuilder) updates]) =
      _$ReservationsRecord;

  static ReservationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReservationsRecordData({
  String? date,
  DocumentReference? timeSlot,
  DocumentReference? user,
  int? classRequiredCredits,
  String? className,
  String? time,
  DocumentReference? chatsRef,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    ReservationsRecord.serializer,
    ReservationsRecord(
      (r) => r
        ..date = date
        ..timeSlot = timeSlot
        ..user = user
        ..classRequiredCredits = classRequiredCredits
        ..className = className
        ..time = time
        ..chatsRef = chatsRef
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
