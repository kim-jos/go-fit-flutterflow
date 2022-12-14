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
    value = object.creditsRequired;
    if (value != null) {
      result
        ..add('creditsRequired')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.maxPeoplePerSlot;
    if (value != null) {
      result
        ..add('max_people_per_slot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxHoursBeforeClass;
    if (value != null) {
      result
        ..add('max_hours_before_class')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minHoursBeforeClass;
    if (value != null) {
      result
        ..add('min_hours_before_class')
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
        case 'creditsRequired':
          result.creditsRequired = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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
        case 'max_people_per_slot':
          result.maxPeoplePerSlot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max_hours_before_class':
          result.maxHoursBeforeClass = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'min_hours_before_class':
          result.minHoursBeforeClass = serializers.deserialize(value,
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

class _$ClassesRecord extends ClassesRecord {
  @override
  final String? name;
  @override
  final String? image;
  @override
  final int? creditsRequired;
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
  final int? maxPeoplePerSlot;
  @override
  final int? maxHoursBeforeClass;
  @override
  final int? minHoursBeforeClass;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ClassesRecord([void Function(ClassesRecordBuilder)? updates]) =>
      (new ClassesRecordBuilder()..update(updates))._build();

  _$ClassesRecord._(
      {this.name,
      this.image,
      this.creditsRequired,
      this.exerciseType,
      this.priority,
      this.distance,
      this.hideClass,
      this.ratings,
      this.maxPeoplePerSlot,
      this.maxHoursBeforeClass,
      this.minHoursBeforeClass,
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
        creditsRequired == other.creditsRequired &&
        exerciseType == other.exerciseType &&
        priority == other.priority &&
        distance == other.distance &&
        hideClass == other.hideClass &&
        ratings == other.ratings &&
        maxPeoplePerSlot == other.maxPeoplePerSlot &&
        maxHoursBeforeClass == other.maxHoursBeforeClass &&
        minHoursBeforeClass == other.minHoursBeforeClass &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, name.hashCode),
                                                image.hashCode),
                                            creditsRequired.hashCode),
                                        exerciseType.hashCode),
                                    priority.hashCode),
                                distance.hashCode),
                            hideClass.hashCode),
                        ratings.hashCode),
                    maxPeoplePerSlot.hashCode),
                maxHoursBeforeClass.hashCode),
            minHoursBeforeClass.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClassesRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('creditsRequired', creditsRequired)
          ..add('exerciseType', exerciseType)
          ..add('priority', priority)
          ..add('distance', distance)
          ..add('hideClass', hideClass)
          ..add('ratings', ratings)
          ..add('maxPeoplePerSlot', maxPeoplePerSlot)
          ..add('maxHoursBeforeClass', maxHoursBeforeClass)
          ..add('minHoursBeforeClass', minHoursBeforeClass)
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

  int? _creditsRequired;
  int? get creditsRequired => _$this._creditsRequired;
  set creditsRequired(int? creditsRequired) =>
      _$this._creditsRequired = creditsRequired;

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

  int? _maxPeoplePerSlot;
  int? get maxPeoplePerSlot => _$this._maxPeoplePerSlot;
  set maxPeoplePerSlot(int? maxPeoplePerSlot) =>
      _$this._maxPeoplePerSlot = maxPeoplePerSlot;

  int? _maxHoursBeforeClass;
  int? get maxHoursBeforeClass => _$this._maxHoursBeforeClass;
  set maxHoursBeforeClass(int? maxHoursBeforeClass) =>
      _$this._maxHoursBeforeClass = maxHoursBeforeClass;

  int? _minHoursBeforeClass;
  int? get minHoursBeforeClass => _$this._minHoursBeforeClass;
  set minHoursBeforeClass(int? minHoursBeforeClass) =>
      _$this._minHoursBeforeClass = minHoursBeforeClass;

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
      _creditsRequired = $v.creditsRequired;
      _exerciseType = $v.exerciseType;
      _priority = $v.priority;
      _distance = $v.distance;
      _hideClass = $v.hideClass;
      _ratings = $v.ratings;
      _maxPeoplePerSlot = $v.maxPeoplePerSlot;
      _maxHoursBeforeClass = $v.maxHoursBeforeClass;
      _minHoursBeforeClass = $v.minHoursBeforeClass;
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
            creditsRequired: creditsRequired,
            exerciseType: exerciseType,
            priority: priority,
            distance: distance,
            hideClass: hideClass,
            ratings: ratings,
            maxPeoplePerSlot: maxPeoplePerSlot,
            maxHoursBeforeClass: maxHoursBeforeClass,
            minHoursBeforeClass: minHoursBeforeClass,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
