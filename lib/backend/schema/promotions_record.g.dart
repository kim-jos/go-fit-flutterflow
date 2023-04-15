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
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
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
    value = object.shareContent;
    if (value != null) {
      result
        ..add('shareContent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contentImages;
    if (value != null) {
      result
        ..add('contentImages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'shareContent':
          result.shareContent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contentImages':
          result.contentImages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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

class _$PromotionsRecord extends PromotionsRecord {
  @override
  final int? amount;
  @override
  final String? type;
  @override
  final String? imageUrl;
  @override
  final DateTime? createdAt;
  @override
  final String? shareContent;
  @override
  final BuiltList<String>? contentImages;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromotionsRecord(
          [void Function(PromotionsRecordBuilder)? updates]) =>
      (new PromotionsRecordBuilder()..update(updates))._build();

  _$PromotionsRecord._(
      {this.amount,
      this.type,
      this.imageUrl,
      this.createdAt,
      this.shareContent,
      this.contentImages,
      this.ffRef})
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
        amount == other.amount &&
        type == other.type &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt &&
        shareContent == other.shareContent &&
        contentImages == other.contentImages &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, shareContent.hashCode);
    _$hash = $jc(_$hash, contentImages.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionsRecord')
          ..add('amount', amount)
          ..add('type', type)
          ..add('imageUrl', imageUrl)
          ..add('createdAt', createdAt)
          ..add('shareContent', shareContent)
          ..add('contentImages', contentImages)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromotionsRecordBuilder
    implements Builder<PromotionsRecord, PromotionsRecordBuilder> {
  _$PromotionsRecord? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _shareContent;
  String? get shareContent => _$this._shareContent;
  set shareContent(String? shareContent) => _$this._shareContent = shareContent;

  ListBuilder<String>? _contentImages;
  ListBuilder<String> get contentImages =>
      _$this._contentImages ??= new ListBuilder<String>();
  set contentImages(ListBuilder<String>? contentImages) =>
      _$this._contentImages = contentImages;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromotionsRecordBuilder() {
    PromotionsRecord._initializeBuilder(this);
  }

  PromotionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _type = $v.type;
      _imageUrl = $v.imageUrl;
      _createdAt = $v.createdAt;
      _shareContent = $v.shareContent;
      _contentImages = $v.contentImages?.toBuilder();
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
    _$PromotionsRecord _$result;
    try {
      _$result = _$v ??
          new _$PromotionsRecord._(
              amount: amount,
              type: type,
              imageUrl: imageUrl,
              createdAt: createdAt,
              shareContent: shareContent,
              contentImages: _contentImages?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contentImages';
        _contentImages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PromotionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
