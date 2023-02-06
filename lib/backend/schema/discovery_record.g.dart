// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DiscoveryRecord> _$discoveryRecordSerializer =
    new _$DiscoveryRecordSerializer();

class _$DiscoveryRecordSerializer
    implements StructuredSerializer<DiscoveryRecord> {
  @override
  final Iterable<Type> types = const [DiscoveryRecord, _$DiscoveryRecord];
  @override
  final String wireName = 'DiscoveryRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DiscoveryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.contentUrl;
    if (value != null) {
      result
        ..add('content_url')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.thumbnailUrl;
    if (value != null) {
      result
        ..add('thumbnail_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
  DiscoveryRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiscoveryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content_url':
          result.contentUrl.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'thumbnail_url':
          result.thumbnailUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
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

class _$DiscoveryRecord extends DiscoveryRecord {
  @override
  final BuiltList<String>? contentUrl;
  @override
  final DateTime? createdAt;
  @override
  final String? thumbnailUrl;
  @override
  final String? title;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DiscoveryRecord([void Function(DiscoveryRecordBuilder)? updates]) =>
      (new DiscoveryRecordBuilder()..update(updates))._build();

  _$DiscoveryRecord._(
      {this.contentUrl,
      this.createdAt,
      this.thumbnailUrl,
      this.title,
      this.ffRef})
      : super._();

  @override
  DiscoveryRecord rebuild(void Function(DiscoveryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscoveryRecordBuilder toBuilder() =>
      new DiscoveryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiscoveryRecord &&
        contentUrl == other.contentUrl &&
        createdAt == other.createdAt &&
        thumbnailUrl == other.thumbnailUrl &&
        title == other.title &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, contentUrl.hashCode), createdAt.hashCode),
                thumbnailUrl.hashCode),
            title.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DiscoveryRecord')
          ..add('contentUrl', contentUrl)
          ..add('createdAt', createdAt)
          ..add('thumbnailUrl', thumbnailUrl)
          ..add('title', title)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DiscoveryRecordBuilder
    implements Builder<DiscoveryRecord, DiscoveryRecordBuilder> {
  _$DiscoveryRecord? _$v;

  ListBuilder<String>? _contentUrl;
  ListBuilder<String> get contentUrl =>
      _$this._contentUrl ??= new ListBuilder<String>();
  set contentUrl(ListBuilder<String>? contentUrl) =>
      _$this._contentUrl = contentUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _thumbnailUrl;
  String? get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  DiscoveryRecordBuilder() {
    DiscoveryRecord._initializeBuilder(this);
  }

  DiscoveryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentUrl = $v.contentUrl?.toBuilder();
      _createdAt = $v.createdAt;
      _thumbnailUrl = $v.thumbnailUrl;
      _title = $v.title;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiscoveryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiscoveryRecord;
  }

  @override
  void update(void Function(DiscoveryRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DiscoveryRecord build() => _build();

  _$DiscoveryRecord _build() {
    _$DiscoveryRecord _$result;
    try {
      _$result = _$v ??
          new _$DiscoveryRecord._(
              contentUrl: _contentUrl?.build(),
              createdAt: createdAt,
              thumbnailUrl: thumbnailUrl,
              title: title,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'contentUrl';
        _contentUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DiscoveryRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
