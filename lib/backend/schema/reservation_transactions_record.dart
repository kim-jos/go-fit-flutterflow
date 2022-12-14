import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reservation_transactions_record.g.dart';

abstract class ReservationTransactionsRecord
    implements
        Built<ReservationTransactionsRecord,
            ReservationTransactionsRecordBuilder> {
  static Serializer<ReservationTransactionsRecord> get serializer =>
      _$reservationTransactionsRecordSerializer;

  DocumentReference? get classRef;

  DateTime? get date;

  String? get time;

  DocumentReference? get userRef;

  DateTime? get createAt;

  String? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(
          ReservationTransactionsRecordBuilder builder) =>
      builder
        ..time = ''
        ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservationTransactions');

  static Stream<ReservationTransactionsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReservationTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReservationTransactionsRecord._();
  factory ReservationTransactionsRecord(
          [void Function(ReservationTransactionsRecordBuilder) updates]) =
      _$ReservationTransactionsRecord;

  static ReservationTransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReservationTransactionsRecordData({
  DocumentReference? classRef,
  DateTime? date,
  String? time,
  DocumentReference? userRef,
  DateTime? createAt,
  String? status,
}) {
  final firestoreData = serializers.toFirestore(
    ReservationTransactionsRecord.serializer,
    ReservationTransactionsRecord(
      (r) => r
        ..classRef = classRef
        ..date = date
        ..time = time
        ..userRef = userRef
        ..createAt = createAt
        ..status = status,
    ),
  );

  return firestoreData;
}
