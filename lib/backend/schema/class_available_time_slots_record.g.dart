// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_available_time_slots_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClassAvailableTimeSlotsRecord>
    _$classAvailableTimeSlotsRecordSerializer =
    new _$ClassAvailableTimeSlotsRecordSerializer();

class _$ClassAvailableTimeSlotsRecordSerializer
    implements StructuredSerializer<ClassAvailableTimeSlotsRecord> {
  @override
  final Iterable<Type> types = const [
    ClassAvailableTimeSlotsRecord,
    _$ClassAvailableTimeSlotsRecord
  ];
  @override
  final String wireName = 'ClassAvailableTimeSlotsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ClassAvailableTimeSlotsRecord object,
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
    value = object.startTime;
    if (value != null) {
      result
        ..add('startTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('endTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.minHoursBeforeClass;
    if (value != null) {
      result
        ..add('minHoursBeforeClass')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxHoursBeforeClass;
    if (value != null) {
      result
        ..add('maxHoursBeforeClass')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reservations;
    if (value != null) {
      result
        ..add('reservations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.maxLimit;
    if (value != null) {
      result
        ..add('maxLimit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minHoursToCancel;
    if (value != null) {
      result
        ..add('minHoursToCancel')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.creditsRequired;
    if (value != null) {
      result
        ..add('creditsRequired')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weekdays;
    if (value != null) {
      result
        ..add('weekdays')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
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
  ClassAvailableTimeSlotsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClassAvailableTimeSlotsRecordBuilder();

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
        case 'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'endTime':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'minHoursBeforeClass':
          result.minHoursBeforeClass = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'maxHoursBeforeClass':
          result.maxHoursBeforeClass = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'reservations':
          result.reservations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'maxLimit':
          result.maxLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'minHoursToCancel':
          result.minHoursToCancel = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'creditsRequired':
          result.creditsRequired = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weekdays':
          result.weekdays.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
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

class _$ClassAvailableTimeSlotsRecord extends ClassAvailableTimeSlotsRecord {
  @override
  final DocumentReference<Object?>? classRef;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final int? minHoursBeforeClass;
  @override
  final int? maxHoursBeforeClass;
  @override
  final BuiltList<DocumentReference<Object?>>? reservations;
  @override
  final int? maxLimit;
  @override
  final int? minHoursToCancel;
  @override
  final int? creditsRequired;
  @override
  final BuiltList<int>? weekdays;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ClassAvailableTimeSlotsRecord(
          [void Function(ClassAvailableTimeSlotsRecordBuilder)? updates]) =>
      (new ClassAvailableTimeSlotsRecordBuilder()..update(updates))._build();

  _$ClassAvailableTimeSlotsRecord._(
      {this.classRef,
      this.startTime,
      this.endTime,
      this.minHoursBeforeClass,
      this.maxHoursBeforeClass,
      this.reservations,
      this.maxLimit,
      this.minHoursToCancel,
      this.creditsRequired,
      this.weekdays,
      this.ffRef})
      : super._();

  @override
  ClassAvailableTimeSlotsRecord rebuild(
          void Function(ClassAvailableTimeSlotsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClassAvailableTimeSlotsRecordBuilder toBuilder() =>
      new ClassAvailableTimeSlotsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassAvailableTimeSlotsRecord &&
        classRef == other.classRef &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        minHoursBeforeClass == other.minHoursBeforeClass &&
        maxHoursBeforeClass == other.maxHoursBeforeClass &&
        reservations == other.reservations &&
        maxLimit == other.maxLimit &&
        minHoursToCancel == other.minHoursToCancel &&
        creditsRequired == other.creditsRequired &&
        weekdays == other.weekdays &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, classRef.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, minHoursBeforeClass.hashCode);
    _$hash = $jc(_$hash, maxHoursBeforeClass.hashCode);
    _$hash = $jc(_$hash, reservations.hashCode);
    _$hash = $jc(_$hash, maxLimit.hashCode);
    _$hash = $jc(_$hash, minHoursToCancel.hashCode);
    _$hash = $jc(_$hash, creditsRequired.hashCode);
    _$hash = $jc(_$hash, weekdays.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClassAvailableTimeSlotsRecord')
          ..add('classRef', classRef)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('minHoursBeforeClass', minHoursBeforeClass)
          ..add('maxHoursBeforeClass', maxHoursBeforeClass)
          ..add('reservations', reservations)
          ..add('maxLimit', maxLimit)
          ..add('minHoursToCancel', minHoursToCancel)
          ..add('creditsRequired', creditsRequired)
          ..add('weekdays', weekdays)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ClassAvailableTimeSlotsRecordBuilder
    implements
        Builder<ClassAvailableTimeSlotsRecord,
            ClassAvailableTimeSlotsRecordBuilder> {
  _$ClassAvailableTimeSlotsRecord? _$v;

  DocumentReference<Object?>? _classRef;
  DocumentReference<Object?>? get classRef => _$this._classRef;
  set classRef(DocumentReference<Object?>? classRef) =>
      _$this._classRef = classRef;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  int? _minHoursBeforeClass;
  int? get minHoursBeforeClass => _$this._minHoursBeforeClass;
  set minHoursBeforeClass(int? minHoursBeforeClass) =>
      _$this._minHoursBeforeClass = minHoursBeforeClass;

  int? _maxHoursBeforeClass;
  int? get maxHoursBeforeClass => _$this._maxHoursBeforeClass;
  set maxHoursBeforeClass(int? maxHoursBeforeClass) =>
      _$this._maxHoursBeforeClass = maxHoursBeforeClass;

  ListBuilder<DocumentReference<Object?>>? _reservations;
  ListBuilder<DocumentReference<Object?>> get reservations =>
      _$this._reservations ??= new ListBuilder<DocumentReference<Object?>>();
  set reservations(ListBuilder<DocumentReference<Object?>>? reservations) =>
      _$this._reservations = reservations;

  int? _maxLimit;
  int? get maxLimit => _$this._maxLimit;
  set maxLimit(int? maxLimit) => _$this._maxLimit = maxLimit;

  int? _minHoursToCancel;
  int? get minHoursToCancel => _$this._minHoursToCancel;
  set minHoursToCancel(int? minHoursToCancel) =>
      _$this._minHoursToCancel = minHoursToCancel;

  int? _creditsRequired;
  int? get creditsRequired => _$this._creditsRequired;
  set creditsRequired(int? creditsRequired) =>
      _$this._creditsRequired = creditsRequired;

  ListBuilder<int>? _weekdays;
  ListBuilder<int> get weekdays => _$this._weekdays ??= new ListBuilder<int>();
  set weekdays(ListBuilder<int>? weekdays) => _$this._weekdays = weekdays;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ClassAvailableTimeSlotsRecordBuilder() {
    ClassAvailableTimeSlotsRecord._initializeBuilder(this);
  }

  ClassAvailableTimeSlotsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _classRef = $v.classRef;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _minHoursBeforeClass = $v.minHoursBeforeClass;
      _maxHoursBeforeClass = $v.maxHoursBeforeClass;
      _reservations = $v.reservations?.toBuilder();
      _maxLimit = $v.maxLimit;
      _minHoursToCancel = $v.minHoursToCancel;
      _creditsRequired = $v.creditsRequired;
      _weekdays = $v.weekdays?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClassAvailableTimeSlotsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClassAvailableTimeSlotsRecord;
  }

  @override
  void update(void Function(ClassAvailableTimeSlotsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClassAvailableTimeSlotsRecord build() => _build();

  _$ClassAvailableTimeSlotsRecord _build() {
    _$ClassAvailableTimeSlotsRecord _$result;
    try {
      _$result = _$v ??
          new _$ClassAvailableTimeSlotsRecord._(
              classRef: classRef,
              startTime: startTime,
              endTime: endTime,
              minHoursBeforeClass: minHoursBeforeClass,
              maxHoursBeforeClass: maxHoursBeforeClass,
              reservations: _reservations?.build(),
              maxLimit: maxLimit,
              minHoursToCancel: minHoursToCancel,
              creditsRequired: creditsRequired,
              weekdays: _weekdays?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reservations';
        _reservations?.build();

        _$failedField = 'weekdays';
        _weekdays?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClassAvailableTimeSlotsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
