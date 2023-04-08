// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReservationsRecord> _$reservationsRecordSerializer =
    new _$ReservationsRecordSerializer();

class _$ReservationsRecordSerializer
    implements StructuredSerializer<ReservationsRecord> {
  @override
  final Iterable<Type> types = const [ReservationsRecord, _$ReservationsRecord];
  @override
  final String wireName = 'ReservationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ReservationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeSlot;
    if (value != null) {
      result
        ..add('timeSlot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.classRequiredCredits;
    if (value != null) {
      result
        ..add('classRequiredCredits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.className;
    if (value != null) {
      result
        ..add('className')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isFinal;
    if (value != null) {
      result
        ..add('isFinal')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('startTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ReservationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'timeSlot':
          result.timeSlot = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'classRequiredCredits':
          result.classRequiredCredits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'className':
          result.className = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'isFinal':
          result.isFinal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'startTime':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ReservationsRecord extends ReservationsRecord {
  @override
  final String? date;
  @override
  final DocumentReference<Object?>? timeSlot;
  @override
  final DocumentReference<Object?>? user;
  @override
  final int? classRequiredCredits;
  @override
  final String? className;
  @override
  final String? time;
  @override
  final DateTime? createdAt;
  @override
  final bool? isFinal;
  @override
  final DateTime? startTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReservationsRecord(
          [void Function(ReservationsRecordBuilder)? updates]) =>
      (new ReservationsRecordBuilder()..update(updates))._build();

  _$ReservationsRecord._(
      {this.date,
      this.timeSlot,
      this.user,
      this.classRequiredCredits,
      this.className,
      this.time,
      this.createdAt,
      this.isFinal,
      this.startTime,
      this.ffRef})
      : super._();

  @override
  ReservationsRecord rebuild(
          void Function(ReservationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservationsRecordBuilder toBuilder() =>
      new ReservationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReservationsRecord &&
        date == other.date &&
        timeSlot == other.timeSlot &&
        user == other.user &&
        classRequiredCredits == other.classRequiredCredits &&
        className == other.className &&
        time == other.time &&
        createdAt == other.createdAt &&
        isFinal == other.isFinal &&
        startTime == other.startTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, timeSlot.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, classRequiredCredits.hashCode);
    _$hash = $jc(_$hash, className.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, isFinal.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReservationsRecord')
          ..add('date', date)
          ..add('timeSlot', timeSlot)
          ..add('user', user)
          ..add('classRequiredCredits', classRequiredCredits)
          ..add('className', className)
          ..add('time', time)
          ..add('createdAt', createdAt)
          ..add('isFinal', isFinal)
          ..add('startTime', startTime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReservationsRecordBuilder
    implements Builder<ReservationsRecord, ReservationsRecordBuilder> {
  _$ReservationsRecord? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  DocumentReference<Object?>? _timeSlot;
  DocumentReference<Object?>? get timeSlot => _$this._timeSlot;
  set timeSlot(DocumentReference<Object?>? timeSlot) =>
      _$this._timeSlot = timeSlot;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  int? _classRequiredCredits;
  int? get classRequiredCredits => _$this._classRequiredCredits;
  set classRequiredCredits(int? classRequiredCredits) =>
      _$this._classRequiredCredits = classRequiredCredits;

  String? _className;
  String? get className => _$this._className;
  set className(String? className) => _$this._className = className;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  bool? _isFinal;
  bool? get isFinal => _$this._isFinal;
  set isFinal(bool? isFinal) => _$this._isFinal = isFinal;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReservationsRecordBuilder() {
    ReservationsRecord._initializeBuilder(this);
  }

  ReservationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _timeSlot = $v.timeSlot;
      _user = $v.user;
      _classRequiredCredits = $v.classRequiredCredits;
      _className = $v.className;
      _time = $v.time;
      _createdAt = $v.createdAt;
      _isFinal = $v.isFinal;
      _startTime = $v.startTime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReservationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReservationsRecord;
  }

  @override
  void update(void Function(ReservationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReservationsRecord build() => _build();

  _$ReservationsRecord _build() {
    final _$result = _$v ??
        new _$ReservationsRecord._(
            date: date,
            timeSlot: timeSlot,
            user: user,
            classRequiredCredits: classRequiredCredits,
            className: className,
            time: time,
            createdAt: createdAt,
            isFinal: isFinal,
            startTime: startTime,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
