// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberships_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MembershipsRecord> _$membershipsRecordSerializer =
    new _$MembershipsRecordSerializer();

class _$MembershipsRecordSerializer
    implements StructuredSerializer<MembershipsRecord> {
  @override
  final Iterable<Type> types = const [MembershipsRecord, _$MembershipsRecord];
  @override
  final String wireName = 'MembershipsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MembershipsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paymentUrl;
    if (value != null) {
      result
        ..add('paymentUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.creditsIssued;
    if (value != null) {
      result
        ..add('creditsIssued')
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
  MembershipsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MembershipsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paymentUrl':
          result.paymentUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'creditsIssued':
          result.creditsIssued = serializers.deserialize(value,
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

class _$MembershipsRecord extends MembershipsRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? price;
  @override
  final String? paymentUrl;
  @override
  final int? creditsIssued;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MembershipsRecord(
          [void Function(MembershipsRecordBuilder)? updates]) =>
      (new MembershipsRecordBuilder()..update(updates))._build();

  _$MembershipsRecord._(
      {this.title,
      this.description,
      this.price,
      this.paymentUrl,
      this.creditsIssued,
      this.ffRef})
      : super._();

  @override
  MembershipsRecord rebuild(void Function(MembershipsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MembershipsRecordBuilder toBuilder() =>
      new MembershipsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MembershipsRecord &&
        title == other.title &&
        description == other.description &&
        price == other.price &&
        paymentUrl == other.paymentUrl &&
        creditsIssued == other.creditsIssued &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), description.hashCode),
                    price.hashCode),
                paymentUrl.hashCode),
            creditsIssued.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MembershipsRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('price', price)
          ..add('paymentUrl', paymentUrl)
          ..add('creditsIssued', creditsIssued)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MembershipsRecordBuilder
    implements Builder<MembershipsRecord, MembershipsRecordBuilder> {
  _$MembershipsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  String? _paymentUrl;
  String? get paymentUrl => _$this._paymentUrl;
  set paymentUrl(String? paymentUrl) => _$this._paymentUrl = paymentUrl;

  int? _creditsIssued;
  int? get creditsIssued => _$this._creditsIssued;
  set creditsIssued(int? creditsIssued) =>
      _$this._creditsIssued = creditsIssued;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MembershipsRecordBuilder() {
    MembershipsRecord._initializeBuilder(this);
  }

  MembershipsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _price = $v.price;
      _paymentUrl = $v.paymentUrl;
      _creditsIssued = $v.creditsIssued;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MembershipsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MembershipsRecord;
  }

  @override
  void update(void Function(MembershipsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MembershipsRecord build() => _build();

  _$MembershipsRecord _build() {
    final _$result = _$v ??
        new _$MembershipsRecord._(
            title: title,
            description: description,
            price: price,
            paymentUrl: paymentUrl,
            creditsIssued: creditsIssued,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
