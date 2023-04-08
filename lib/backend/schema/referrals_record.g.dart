// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReferralsRecord> _$referralsRecordSerializer =
    new _$ReferralsRecordSerializer();

class _$ReferralsRecordSerializer
    implements StructuredSerializer<ReferralsRecord> {
  @override
  final Iterable<Type> types = const [ReferralsRecord, _$ReferralsRecord];
  @override
  final String wireName = 'ReferralsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReferralsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.referralBy;
    if (value != null) {
      result
        ..add('referralBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ReferralsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReferralsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'referralBy':
          result.referralBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ReferralsRecord extends ReferralsRecord {
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? referralBy;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReferralsRecord([void Function(ReferralsRecordBuilder)? updates]) =>
      (new ReferralsRecordBuilder()..update(updates))._build();

  _$ReferralsRecord._(
      {this.createdAt, this.referralBy, this.userRef, this.ffRef})
      : super._();

  @override
  ReferralsRecord rebuild(void Function(ReferralsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReferralsRecordBuilder toBuilder() =>
      new ReferralsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReferralsRecord &&
        createdAt == other.createdAt &&
        referralBy == other.referralBy &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, referralBy.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReferralsRecord')
          ..add('createdAt', createdAt)
          ..add('referralBy', referralBy)
          ..add('userRef', userRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReferralsRecordBuilder
    implements Builder<ReferralsRecord, ReferralsRecordBuilder> {
  _$ReferralsRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _referralBy;
  DocumentReference<Object?>? get referralBy => _$this._referralBy;
  set referralBy(DocumentReference<Object?>? referralBy) =>
      _$this._referralBy = referralBy;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReferralsRecordBuilder() {
    ReferralsRecord._initializeBuilder(this);
  }

  ReferralsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _referralBy = $v.referralBy;
      _userRef = $v.userRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReferralsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReferralsRecord;
  }

  @override
  void update(void Function(ReferralsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReferralsRecord build() => _build();

  _$ReferralsRecord _build() {
    final _$result = _$v ??
        new _$ReferralsRecord._(
            createdAt: createdAt,
            referralBy: referralBy,
            userRef: userRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
