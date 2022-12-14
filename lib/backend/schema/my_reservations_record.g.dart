// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reservations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyReservationsRecord> _$myReservationsRecordSerializer =
    new _$MyReservationsRecordSerializer();

class _$MyReservationsRecordSerializer
    implements StructuredSerializer<MyReservationsRecord> {
  @override
  final Iterable<Type> types = const [
    MyReservationsRecord,
    _$MyReservationsRecord
  ];
  @override
  final String wireName = 'MyReservationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MyReservationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.className;
    if (value != null) {
      result
        ..add('className')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reservationsRef;
    if (value != null) {
      result
        ..add('reservationsRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.classRequiredCredits;
    if (value != null) {
      result
        ..add('classRequiredCredits')
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
  MyReservationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyReservationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'className':
          result.className = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reservationsRef':
          result.reservationsRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'classRequiredCredits':
          result.classRequiredCredits = serializers.deserialize(value,
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

class _$MyReservationsRecord extends MyReservationsRecord {
  @override
  final DateTime? date;
  @override
  final String? time;
  @override
  final String? className;
  @override
  final DocumentReference<Object?>? reservationsRef;
  @override
  final String? status;
  @override
  final int? classRequiredCredits;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MyReservationsRecord(
          [void Function(MyReservationsRecordBuilder)? updates]) =>
      (new MyReservationsRecordBuilder()..update(updates))._build();

  _$MyReservationsRecord._(
      {this.date,
      this.time,
      this.className,
      this.reservationsRef,
      this.status,
      this.classRequiredCredits,
      this.ffRef})
      : super._();

  @override
  MyReservationsRecord rebuild(
          void Function(MyReservationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyReservationsRecordBuilder toBuilder() =>
      new MyReservationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyReservationsRecord &&
        date == other.date &&
        time == other.time &&
        className == other.className &&
        reservationsRef == other.reservationsRef &&
        status == other.status &&
        classRequiredCredits == other.classRequiredCredits &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, date.hashCode), time.hashCode),
                        className.hashCode),
                    reservationsRef.hashCode),
                status.hashCode),
            classRequiredCredits.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyReservationsRecord')
          ..add('date', date)
          ..add('time', time)
          ..add('className', className)
          ..add('reservationsRef', reservationsRef)
          ..add('status', status)
          ..add('classRequiredCredits', classRequiredCredits)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MyReservationsRecordBuilder
    implements Builder<MyReservationsRecord, MyReservationsRecordBuilder> {
  _$MyReservationsRecord? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  String? _className;
  String? get className => _$this._className;
  set className(String? className) => _$this._className = className;

  DocumentReference<Object?>? _reservationsRef;
  DocumentReference<Object?>? get reservationsRef => _$this._reservationsRef;
  set reservationsRef(DocumentReference<Object?>? reservationsRef) =>
      _$this._reservationsRef = reservationsRef;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _classRequiredCredits;
  int? get classRequiredCredits => _$this._classRequiredCredits;
  set classRequiredCredits(int? classRequiredCredits) =>
      _$this._classRequiredCredits = classRequiredCredits;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MyReservationsRecordBuilder() {
    MyReservationsRecord._initializeBuilder(this);
  }

  MyReservationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _time = $v.time;
      _className = $v.className;
      _reservationsRef = $v.reservationsRef;
      _status = $v.status;
      _classRequiredCredits = $v.classRequiredCredits;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyReservationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyReservationsRecord;
  }

  @override
  void update(void Function(MyReservationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyReservationsRecord build() => _build();

  _$MyReservationsRecord _build() {
    final _$result = _$v ??
        new _$MyReservationsRecord._(
            date: date,
            time: time,
            className: className,
            reservationsRef: reservationsRef,
            status: status,
            classRequiredCredits: classRequiredCredits,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
