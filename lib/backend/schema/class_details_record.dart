import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassDetailsRecord extends FirestoreRecord {
  ClassDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  // "monthlyLimit" field.
  int? _monthlyLimit;
  int get monthlyLimit => _monthlyLimit ?? 0;
  bool hasMonthlyLimit() => _monthlyLimit != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "misc" field.
  String? _misc;
  String get misc => _misc ?? '';
  bool hasMisc() => _misc != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "requirements" field.
  String? _requirements;
  String get requirements => _requirements ?? '';
  bool hasRequirements() => _requirements != null;

  // "latitude" field.
  LatLng? _latitude;
  LatLng? get latitude => _latitude;
  bool hasLatitude() => _latitude != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "businessHours" field.
  List<String>? _businessHours;
  List<String> get businessHours => _businessHours ?? const [];
  bool hasBusinessHours() => _businessHours != null;

  // "info" field.
  List<String>? _info;
  List<String> get info => _info ?? const [];
  bool hasInfo() => _info != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "hasShower" field.
  bool? _hasShower;
  bool get hasShower => _hasShower ?? false;
  bool hasHasShower() => _hasShower != null;

  void _initializeFields() {
    _classRef = snapshotData['classRef'] as DocumentReference?;
    _monthlyLimit = snapshotData['monthlyLimit'] as int?;
    _duration = snapshotData['duration'] as String?;
    _misc = snapshotData['misc'] as String?;
    _address = snapshotData['address'] as String?;
    _website = snapshotData['website'] as String?;
    _description = snapshotData['description'] as String?;
    _requirements = snapshotData['requirements'] as String?;
    _latitude = snapshotData['latitude'] as LatLng?;
    _instagram = snapshotData['instagram'] as String?;
    _images = getDataList(snapshotData['images']);
    _businessHours = getDataList(snapshotData['businessHours']);
    _info = getDataList(snapshotData['info']);
    _price = snapshotData['price'] as int?;
    _hasShower = snapshotData['hasShower'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classDetails');

  static Stream<ClassDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassDetailsRecord.fromSnapshot(s));

  static Future<ClassDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassDetailsRecord.fromSnapshot(s));

  static ClassDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClassDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClassDetailsRecordData({
  DocumentReference? classRef,
  int? monthlyLimit,
  String? duration,
  String? misc,
  String? address,
  String? website,
  String? description,
  String? requirements,
  LatLng? latitude,
  String? instagram,
  int? price,
  bool? hasShower,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'classRef': classRef,
      'monthlyLimit': monthlyLimit,
      'duration': duration,
      'misc': misc,
      'address': address,
      'website': website,
      'description': description,
      'requirements': requirements,
      'latitude': latitude,
      'instagram': instagram,
      'price': price,
      'hasShower': hasShower,
    }.withoutNulls,
  );

  return firestoreData;
}
