// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClassesRecord> _$classesRecordSerializer =
    new _$ClassesRecordSerializer();

class _$ClassesRecordSerializer implements StructuredSerializer<ClassesRecord> {
  @override
  final Iterable<Type> types = const [ClassesRecord, _$ClassesRecord];
  @override
  final String wireName = 'ClassesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ClassesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.exerciseType;
    if (value != null) {
      result
        ..add('exerciseType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.distance;
    if (value != null) {
      result
        ..add('distance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hideClass;
    if (value != null) {
      result
        ..add('hideClass')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ratings;
    if (value != null) {
      result
        ..add('ratings')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.coords;
    if (value != null) {
      result
        ..add('coords')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.isPopular;
    if (value != null) {
      result
        ..add('isPopular')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.creditsRequired;
    if (value != null) {
      result
        ..add('creditsRequired')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paymentUrl;
    if (value != null) {
      result
        ..add('paymentUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ClassesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'exerciseType':
          result.exerciseType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'distance':
          result.distance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hideClass':
          result.hideClass = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'ratings':
          result.ratings = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'coords':
          result.coords = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'isPopular':
          result.isPopular = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'creditsRequired':
          result.creditsRequired = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paymentUrl':
          result.paymentUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ClassesRecord extends ClassesRecord {
  @override
  final String? name;
  @override
  final String? image;
  @override
  final String? exerciseType;
  @override
  final int? priority;
  @override
  final String? distance;
  @override
  final bool? hideClass;
  @override
  final int? ratings;
  @override
  final LatLng? coords;
  @override
  final bool? isPopular;
  @override
  final int? creditsRequired;
  @override
  final String? paymentUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ClassesRecord([void Function(ClassesRecordBuilder)? updates]) =>
      (new ClassesRecordBuilder()..update(updates))._build();

  _$ClassesRecord._(
      {this.name,
      this.image,
      this.exerciseType,
      this.priority,
      this.distance,
      this.hideClass,
      this.ratings,
      this.coords,
      this.isPopular,
      this.creditsRequired,
      this.paymentUrl,
      this.ffRef})
      : super._();

  @override
  ClassesRecord rebuild(void Function(ClassesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassesRecordBuilder toBuilder() => new ClassesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassesRecord &&
        name == other.name &&
        image == other.image &&
        exerciseType == other.exerciseType &&
        priority == other.priority &&
        distance == other.distance &&
        hideClass == other.hideClass &&
        ratings == other.ratings &&
        coords == other.coords &&
        isPopular == other.isPopular &&
        creditsRequired == other.creditsRequired &&
        paymentUrl == other.paymentUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, exerciseType.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, distance.hashCode);
    _$hash = $jc(_$hash, hideClass.hashCode);
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, coords.hashCode);
    _$hash = $jc(_$hash, isPopular.hashCode);
    _$hash = $jc(_$hash, creditsRequired.hashCode);
    _$hash = $jc(_$hash, paymentUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClassesRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('exerciseType', exerciseType)
          ..add('priority', priority)
          ..add('distance', distance)
          ..add('hideClass', hideClass)
          ..add('ratings', ratings)
          ..add('coords', coords)
          ..add('isPopular', isPopular)
          ..add('creditsRequired', creditsRequired)
          ..add('paymentUrl', paymentUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ClassesRecordBuilder
    implements Builder<ClassesRecord, ClassesRecordBuilder> {
  _$ClassesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _exerciseType;
  String? get exerciseType => _$this._exerciseType;
  set exerciseType(String? exerciseType) => _$this._exerciseType = exerciseType;

  int? _priority;
  int? get priority => _$this._priority;
  set priority(int? priority) => _$this._priority = priority;

  String? _distance;
  String? get distance => _$this._distance;
  set distance(String? distance) => _$this._distance = distance;

  bool? _hideClass;
  bool? get hideClass => _$this._hideClass;
  set hideClass(bool? hideClass) => _$this._hideClass = hideClass;

  int? _ratings;
  int? get ratings => _$this._ratings;
  set ratings(int? ratings) => _$this._ratings = ratings;

  LatLng? _coords;
  LatLng? get coords => _$this._coords;
  set coords(LatLng? coords) => _$this._coords = coords;

  bool? _isPopular;
  bool? get isPopular => _$this._isPopular;
  set isPopular(bool? isPopular) => _$this._isPopular = isPopular;

  int? _creditsRequired;
  int? get creditsRequired => _$this._creditsRequired;
  set creditsRequired(int? creditsRequired) =>
      _$this._creditsRequired = creditsRequired;

  String? _paymentUrl;
  String? get paymentUrl => _$this._paymentUrl;
  set paymentUrl(String? paymentUrl) => _$this._paymentUrl = paymentUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ClassesRecordBuilder() {
    ClassesRecord._initializeBuilder(this);
  }

  ClassesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _exerciseType = $v.exerciseType;
      _priority = $v.priority;
      _distance = $v.distance;
      _hideClass = $v.hideClass;
      _ratings = $v.ratings;
      _coords = $v.coords;
      _isPopular = $v.isPopular;
      _creditsRequired = $v.creditsRequired;
      _paymentUrl = $v.paymentUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClassesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClassesRecord;
  }

  @override
  void update(void Function(ClassesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClassesRecord build() => _build();

  _$ClassesRecord _build() {
    final _$result = _$v ??
        new _$ClassesRecord._(
            name: name,
            image: image,
            exerciseType: exerciseType,
            priority: priority,
            distance: distance,
            hideClass: hideClass,
            ratings: ratings,
            coords: coords,
            isPopular: isPopular,
            creditsRequired: creditsRequired,
            paymentUrl: paymentUrl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
