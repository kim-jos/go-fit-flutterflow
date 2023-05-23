import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClassesRecord extends FirestoreRecord {
  ClassesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "exerciseType" field.
  String? _exerciseType;
  String get exerciseType => _exerciseType ?? '';
  bool hasExerciseType() => _exerciseType != null;

  // "priority" field.
  int? _priority;
  int get priority => _priority ?? 0;
  bool hasPriority() => _priority != null;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  bool hasDistance() => _distance != null;

  // "hideClass" field.
  bool? _hideClass;
  bool get hideClass => _hideClass ?? false;
  bool hasHideClass() => _hideClass != null;

  // "ratings" field.
  int? _ratings;
  int get ratings => _ratings ?? 0;
  bool hasRatings() => _ratings != null;

  // "coords" field.
  LatLng? _coords;
  LatLng? get coords => _coords;
  bool hasCoords() => _coords != null;

  // "isPopular" field.
  bool? _isPopular;
  bool get isPopular => _isPopular ?? false;
  bool hasIsPopular() => _isPopular != null;

  // "creditsRequired" field.
  int? _creditsRequired;
  int get creditsRequired => _creditsRequired ?? 0;
  bool hasCreditsRequired() => _creditsRequired != null;

  // "paymentUrl" field.
  String? _paymentUrl;
  String get paymentUrl => _paymentUrl ?? '';
  bool hasPaymentUrl() => _paymentUrl != null;

  // "locationFilter" field.
  String? _locationFilter;
  String get locationFilter => _locationFilter ?? '';
  bool hasLocationFilter() => _locationFilter != null;

  // "originalPrice" field.
  int? _originalPrice;
  int get originalPrice => _originalPrice ?? 0;
  bool hasOriginalPrice() => _originalPrice != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _exerciseType = snapshotData['exerciseType'] as String?;
    _priority = snapshotData['priority'] as int?;
    _distance = snapshotData['distance'] as String?;
    _hideClass = snapshotData['hideClass'] as bool?;
    _ratings = snapshotData['ratings'] as int?;
    _coords = snapshotData['coords'] as LatLng?;
    _isPopular = snapshotData['isPopular'] as bool?;
    _creditsRequired = snapshotData['creditsRequired'] as int?;
    _paymentUrl = snapshotData['paymentUrl'] as String?;
    _locationFilter = snapshotData['locationFilter'] as String?;
    _originalPrice = snapshotData['originalPrice'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('classes');

  static Stream<ClassesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClassesRecord.fromSnapshot(s));

  static Future<ClassesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClassesRecord.fromSnapshot(s));

  static ClassesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClassesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClassesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClassesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClassesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createClassesRecordData({
  String? name,
  String? image,
  String? exerciseType,
  int? priority,
  String? distance,
  bool? hideClass,
  int? ratings,
  LatLng? coords,
  bool? isPopular,
  int? creditsRequired,
  String? paymentUrl,
  String? locationFilter,
  int? originalPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'exerciseType': exerciseType,
      'priority': priority,
      'distance': distance,
      'hideClass': hideClass,
      'ratings': ratings,
      'coords': coords,
      'isPopular': isPopular,
      'creditsRequired': creditsRequired,
      'paymentUrl': paymentUrl,
      'locationFilter': locationFilter,
      'originalPrice': originalPrice,
    }.withoutNulls,
  );

  return firestoreData;
}
