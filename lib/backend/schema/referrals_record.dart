import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'referrals_record.g.dart';

abstract class ReferralsRecord
    implements Built<ReferralsRecord, ReferralsRecordBuilder> {
  static Serializer<ReferralsRecord> get serializer =>
      _$referralsRecordSerializer;

  DateTime? get createdAt;

  DocumentReference? get referralBy;

  DocumentReference? get userRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReferralsRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('referrals');

  static Stream<ReferralsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReferralsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReferralsRecord._();
  factory ReferralsRecord([void Function(ReferralsRecordBuilder) updates]) =
      _$ReferralsRecord;

  static ReferralsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReferralsRecordData({
  DateTime? createdAt,
  DocumentReference? referralBy,
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    ReferralsRecord.serializer,
    ReferralsRecord(
      (r) => r
        ..createdAt = createdAt
        ..referralBy = referralBy
        ..userRef = userRef,
    ),
  );

  return firestoreData;
}
