// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_transactions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReservationTransactionsRecord>
    _$reservationTransactionsRecordSerializer =
    new _$ReservationTransactionsRecordSerializer();

class _$ReservationTransactionsRecordSerializer
    implements StructuredSerializer<ReservationTransactionsRecord> {
  @override
  final Iterable<Type> types = const [
    ReservationTransactionsRecord,
    _$ReservationTransactionsRecord
  ];
  @override
  final String wireName = 'ReservationTransactionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ReservationTransactionsRecord object,
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
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createAt;
    if (value != null) {
      result
        ..add('createAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
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
  ReservationTransactionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReservationTransactionsRecordBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'createAt':
          result.createAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$ReservationTransactionsRecord extends ReservationTransactionsRecord {
  @override
  final DocumentReference<Object?>? classRef;
  @override
  final DateTime? date;
  @override
  final String? time;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DateTime? createAt;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReservationTransactionsRecord(
          [void Function(ReservationTransactionsRecordBuilder)? updates]) =>
      (new ReservationTransactionsRecordBuilder()..update(updates))._build();

  _$ReservationTransactionsRecord._(
      {this.classRef,
      this.date,
      this.time,
      this.userRef,
      this.createAt,
      this.status,
      this.ffRef})
      : super._();

  @override
  ReservationTransactionsRecord rebuild(
          void Function(ReservationTransactionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservationTransactionsRecordBuilder toBuilder() =>
      new ReservationTransactionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReservationTransactionsRecord &&
        classRef == other.classRef &&
        date == other.date &&
        time == other.time &&
        userRef == other.userRef &&
        createAt == other.createAt &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, classRef.hashCode), date.hashCode),
                        time.hashCode),
                    userRef.hashCode),
                createAt.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReservationTransactionsRecord')
          ..add('classRef', classRef)
          ..add('date', date)
          ..add('time', time)
          ..add('userRef', userRef)
          ..add('createAt', createAt)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReservationTransactionsRecordBuilder
    implements
        Builder<ReservationTransactionsRecord,
            ReservationTransactionsRecordBuilder> {
  _$ReservationTransactionsRecord? _$v;

  DocumentReference<Object?>? _classRef;
  DocumentReference<Object?>? get classRef => _$this._classRef;
  set classRef(DocumentReference<Object?>? classRef) =>
      _$this._classRef = classRef;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DateTime? _createAt;
  DateTime? get createAt => _$this._createAt;
  set createAt(DateTime? createAt) => _$this._createAt = createAt;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReservationTransactionsRecordBuilder() {
    ReservationTransactionsRecord._initializeBuilder(this);
  }

  ReservationTransactionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _classRef = $v.classRef;
      _date = $v.date;
      _time = $v.time;
      _userRef = $v.userRef;
      _createAt = $v.createAt;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReservationTransactionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReservationTransactionsRecord;
  }

  @override
  void update(void Function(ReservationTransactionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReservationTransactionsRecord build() => _build();

  _$ReservationTransactionsRecord _build() {
    final _$result = _$v ??
        new _$ReservationTransactionsRecord._(
            classRef: classRef,
            date: date,
            time: time,
            userRef: userRef,
            createAt: createAt,
            status: status,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
