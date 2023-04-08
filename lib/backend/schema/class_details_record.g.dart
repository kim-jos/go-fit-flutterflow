// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_details_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClassDetailsRecord> _$classDetailsRecordSerializer =
    new _$ClassDetailsRecordSerializer();

class _$ClassDetailsRecordSerializer
    implements StructuredSerializer<ClassDetailsRecord> {
  @override
  final Iterable<Type> types = const [ClassDetailsRecord, _$ClassDetailsRecord];
  @override
  final String wireName = 'ClassDetailsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ClassDetailsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.classRef;
    if (value != null) {
      result
        ..add('classRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.monthlyLimit;
    if (value != null) {
      result
        ..add('monthlyLimit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.misc;
    if (value != null) {
      result
        ..add('misc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.requirements;
    if (value != null) {
      result
        ..add('requirements')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.latitude;
    if (value != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.instagram;
    if (value != null) {
      result
        ..add('instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.businessHours;
    if (value != null) {
      result
        ..add('businessHours')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ClassDetailsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassDetailsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'classRef':
          result.classRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'monthlyLimit':
          result.monthlyLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'misc':
          result.misc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'requirements':
          result.requirements = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'instagram':
          result.instagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'businessHours':
          result.businessHours.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'info':
          result.info.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ClassDetailsRecord extends ClassDetailsRecord {
  @override
  final DocumentReference<Object?>? classRef;
  @override
  final int? monthlyLimit;
  @override
  final String? duration;
  @override
  final String? misc;
  @override
  final String? address;
  @override
  final String? website;
  @override
  final String? description;
  @override
  final String? requirements;
  @override
  final LatLng? latitude;
  @override
  final String? instagram;
  @override
  final BuiltList<String>? images;
  @override
  final BuiltList<String>? businessHours;
  @override
  final BuiltList<String>? info;
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ClassDetailsRecord(
          [void Function(ClassDetailsRecordBuilder)? updates]) =>
      (new ClassDetailsRecordBuilder()..update(updates))._build();

  _$ClassDetailsRecord._(
      {this.classRef,
      this.monthlyLimit,
      this.duration,
      this.misc,
      this.address,
      this.website,
      this.description,
      this.requirements,
      this.latitude,
      this.instagram,
      this.images,
      this.businessHours,
      this.info,
      this.price,
      this.ffRef})
      : super._();

  @override
  ClassDetailsRecord rebuild(
          void Function(ClassDetailsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassDetailsRecordBuilder toBuilder() =>
      new ClassDetailsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassDetailsRecord &&
        classRef == other.classRef &&
        monthlyLimit == other.monthlyLimit &&
        duration == other.duration &&
        misc == other.misc &&
        address == other.address &&
        website == other.website &&
        description == other.description &&
        requirements == other.requirements &&
        latitude == other.latitude &&
        instagram == other.instagram &&
        images == other.images &&
        businessHours == other.businessHours &&
        info == other.info &&
        price == other.price &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, classRef.hashCode);
    _$hash = $jc(_$hash, monthlyLimit.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, misc.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, requirements.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, instagram.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, businessHours.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClassDetailsRecord')
          ..add('classRef', classRef)
          ..add('monthlyLimit', monthlyLimit)
          ..add('duration', duration)
          ..add('misc', misc)
          ..add('address', address)
          ..add('website', website)
          ..add('description', description)
          ..add('requirements', requirements)
          ..add('latitude', latitude)
          ..add('instagram', instagram)
          ..add('images', images)
          ..add('businessHours', businessHours)
          ..add('info', info)
          ..add('price', price)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ClassDetailsRecordBuilder
    implements Builder<ClassDetailsRecord, ClassDetailsRecordBuilder> {
  _$ClassDetailsRecord? _$v;

  DocumentReference<Object?>? _classRef;
  DocumentReference<Object?>? get classRef => _$this._classRef;
  set classRef(DocumentReference<Object?>? classRef) =>
      _$this._classRef = classRef;

  int? _monthlyLimit;
  int? get monthlyLimit => _$this._monthlyLimit;
  set monthlyLimit(int? monthlyLimit) => _$this._monthlyLimit = monthlyLimit;

  String? _duration;
  String? get duration => _$this._duration;
  set duration(String? duration) => _$this._duration = duration;

  String? _misc;
  String? get misc => _$this._misc;
  set misc(String? misc) => _$this._misc = misc;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _requirements;
  String? get requirements => _$this._requirements;
  set requirements(String? requirements) => _$this._requirements = requirements;

  LatLng? _latitude;
  LatLng? get latitude => _$this._latitude;
  set latitude(LatLng? latitude) => _$this._latitude = latitude;

  String? _instagram;
  String? get instagram => _$this._instagram;
  set instagram(String? instagram) => _$this._instagram = instagram;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  ListBuilder<String>? _businessHours;
  ListBuilder<String> get businessHours =>
      _$this._businessHours ??= new ListBuilder<String>();
  set businessHours(ListBuilder<String>? businessHours) =>
      _$this._businessHours = businessHours;

  ListBuilder<String>? _info;
  ListBuilder<String> get info => _$this._info ??= new ListBuilder<String>();
  set info(ListBuilder<String>? info) => _$this._info = info;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ClassDetailsRecordBuilder() {
    ClassDetailsRecord._initializeBuilder(this);
  }

  ClassDetailsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _classRef = $v.classRef;
      _monthlyLimit = $v.monthlyLimit;
      _duration = $v.duration;
      _misc = $v.misc;
      _address = $v.address;
      _website = $v.website;
      _description = $v.description;
      _requirements = $v.requirements;
      _latitude = $v.latitude;
      _instagram = $v.instagram;
      _images = $v.images?.toBuilder();
      _businessHours = $v.businessHours?.toBuilder();
      _info = $v.info?.toBuilder();
      _price = $v.price;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClassDetailsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClassDetailsRecord;
  }

  @override
  void update(void Function(ClassDetailsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClassDetailsRecord build() => _build();

  _$ClassDetailsRecord _build() {
    _$ClassDetailsRecord _$result;
    try {
      _$result = _$v ??
          new _$ClassDetailsRecord._(
              classRef: classRef,
              monthlyLimit: monthlyLimit,
              duration: duration,
              misc: misc,
              address: address,
              website: website,
              description: description,
              requirements: requirements,
              latitude: latitude,
              instagram: instagram,
              images: _images?.build(),
              businessHours: _businessHours?.build(),
              info: _info?.build(),
              price: price,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
        _$failedField = 'businessHours';
        _businessHours?.build();
        _$failedField = 'info';
        _info?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClassDetailsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
