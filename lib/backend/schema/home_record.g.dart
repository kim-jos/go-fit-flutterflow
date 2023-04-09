// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HomeRecord> _$homeRecordSerializer = new _$HomeRecordSerializer();

class _$HomeRecordSerializer implements StructuredSerializer<HomeRecord> {
  @override
  final Iterable<Type> types = const [HomeRecord, _$HomeRecord];
  @override
  final String wireName = 'HomeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, HomeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('videoUrl')
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
  HomeRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'videoUrl':
          result.videoUrl = serializers.deserialize(value,
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

class _$HomeRecord extends HomeRecord {
  @override
  final String? videoUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$HomeRecord([void Function(HomeRecordBuilder)? updates]) =>
      (new HomeRecordBuilder()..update(updates))._build();

  _$HomeRecord._({this.videoUrl, this.ffRef}) : super._();

  @override
  HomeRecord rebuild(void Function(HomeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeRecordBuilder toBuilder() => new HomeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeRecord &&
        videoUrl == other.videoUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, videoUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeRecord')
          ..add('videoUrl', videoUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class HomeRecordBuilder implements Builder<HomeRecord, HomeRecordBuilder> {
  _$HomeRecord? _$v;

  String? _videoUrl;
  String? get videoUrl => _$this._videoUrl;
  set videoUrl(String? videoUrl) => _$this._videoUrl = videoUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  HomeRecordBuilder() {
    HomeRecord._initializeBuilder(this);
  }

  HomeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _videoUrl = $v.videoUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeRecord;
  }

  @override
  void update(void Function(HomeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeRecord build() => _build();

  _$HomeRecord _build() {
    final _$result =
        _$v ?? new _$HomeRecord._(videoUrl: videoUrl, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
