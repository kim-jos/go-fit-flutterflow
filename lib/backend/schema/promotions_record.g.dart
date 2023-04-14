// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromotionsRecord> _$promotionsRecordSerializer =
    new _$PromotionsRecordSerializer();

class _$PromotionsRecordSerializer
    implements StructuredSerializer<PromotionsRecord> {
  @override
  final Iterable<Type> types = const [PromotionsRecord, _$PromotionsRecord];
  @override
  final String wireName = 'PromotionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromotionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.friendReferral;
    if (value != null) {
      result
        ..add('friendReferral')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.signUpEvent;
    if (value != null) {
      result
        ..add('signUpEvent')
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
  PromotionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromotionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'friendReferral':
          result.friendReferral = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'signUpEvent':
          result.signUpEvent = serializers.deserialize(value,
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

class _$PromotionsRecord extends PromotionsRecord {
  @override
  final int? friendReferral;
  @override
  final int? signUpEvent;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromotionsRecord(
          [void Function(PromotionsRecordBuilder)? updates]) =>
      (new PromotionsRecordBuilder()..update(updates))._build();

  _$PromotionsRecord._({this.friendReferral, this.signUpEvent, this.ffRef})
      : super._();

  @override
  PromotionsRecord rebuild(void Function(PromotionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromotionsRecordBuilder toBuilder() =>
      new PromotionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromotionsRecord &&
        friendReferral == other.friendReferral &&
        signUpEvent == other.signUpEvent &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, friendReferral.hashCode);
    _$hash = $jc(_$hash, signUpEvent.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionsRecord')
          ..add('friendReferral', friendReferral)
          ..add('signUpEvent', signUpEvent)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromotionsRecordBuilder
    implements Builder<PromotionsRecord, PromotionsRecordBuilder> {
  _$PromotionsRecord? _$v;

  int? _friendReferral;
  int? get friendReferral => _$this._friendReferral;
  set friendReferral(int? friendReferral) =>
      _$this._friendReferral = friendReferral;

  int? _signUpEvent;
  int? get signUpEvent => _$this._signUpEvent;
  set signUpEvent(int? signUpEvent) => _$this._signUpEvent = signUpEvent;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromotionsRecordBuilder() {
    PromotionsRecord._initializeBuilder(this);
  }

  PromotionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _friendReferral = $v.friendReferral;
      _signUpEvent = $v.signUpEvent;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromotionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromotionsRecord;
  }

  @override
  void update(void Function(PromotionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromotionsRecord build() => _build();

  _$PromotionsRecord _build() {
    final _$result = _$v ??
        new _$PromotionsRecord._(
            friendReferral: friendReferral,
            signUpEvent: signUpEvent,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
