import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'my_reservations_record.g.dart';

abstract class MyReservationsRecord
    implements Built<MyReservationsRecord, MyReservationsRecordBuilder> {
  static Serializer<MyReservationsRecord> get serializer =>
      _$myReservationsRecordSerializer;

  DateTime? get date;

  String? get time;

  String? get className;

  DocumentReference? get reservationsRef;

  String? get status;

  int? get classRequiredCredits;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MyReservationsRecordBuilder builder) => builder
    ..time = ''
    ..className = ''
    ..status = ''
    ..classRequiredCredits = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('myReservations')
          : FirebaseFirestore.instance.collectionGroup('myReservations');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('myReservations').doc();

  static Stream<MyReservationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MyReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MyReservationsRecord._();
  factory MyReservationsRecord(
          [void Function(MyReservationsRecordBuilder) updates]) =
      _$MyReservationsRecord;

  static MyReservationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMyReservationsRecordData({
  DateTime? date,
  String? time,
  String? className,
  DocumentReference? reservationsRef,
  String? status,
  int? classRequiredCredits,
}) {
  final firestoreData = serializers.toFirestore(
    MyReservationsRecord.serializer,
    MyReservationsRecord(
      (m) => m
        ..date = date
        ..time = time
        ..className = className
        ..reservationsRef = reservationsRef
        ..status = status
        ..classRequiredCredits = classRequiredCredits,
    ),
  );

  return firestoreData;
}
