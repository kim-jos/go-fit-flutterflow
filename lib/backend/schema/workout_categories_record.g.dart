// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkoutCategoriesRecord> _$workoutCategoriesRecordSerializer =
    new _$WorkoutCategoriesRecordSerializer();

class _$WorkoutCategoriesRecordSerializer
    implements StructuredSerializer<WorkoutCategoriesRecord> {
  @override
  final Iterable<Type> types = const [
    WorkoutCategoriesRecord,
    _$WorkoutCategoriesRecord
  ];
  @override
  final String wireName = 'WorkoutCategoriesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WorkoutCategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.priority;
    if (value != null) {
      result
        ..add('priority')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
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
  WorkoutCategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkoutCategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'priority':
          result.priority = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageUrl':
          result.imageUrl = serializers.deserialize(value,
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

class _$WorkoutCategoriesRecord extends WorkoutCategoriesRecord {
  @override
  final int? priority;
  @override
  final String? category;
  @override
  final String? imageUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WorkoutCategoriesRecord(
          [void Function(WorkoutCategoriesRecordBuilder)? updates]) =>
      (new WorkoutCategoriesRecordBuilder()..update(updates))._build();

  _$WorkoutCategoriesRecord._(
      {this.priority, this.category, this.imageUrl, this.ffRef})
      : super._();

  @override
  WorkoutCategoriesRecord rebuild(
          void Function(WorkoutCategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkoutCategoriesRecordBuilder toBuilder() =>
      new WorkoutCategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkoutCategoriesRecord &&
        priority == other.priority &&
        category == other.category &&
        imageUrl == other.imageUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkoutCategoriesRecord')
          ..add('priority', priority)
          ..add('category', category)
          ..add('imageUrl', imageUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WorkoutCategoriesRecordBuilder
    implements
        Builder<WorkoutCategoriesRecord, WorkoutCategoriesRecordBuilder> {
  _$WorkoutCategoriesRecord? _$v;

  int? _priority;
  int? get priority => _$this._priority;
  set priority(int? priority) => _$this._priority = priority;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WorkoutCategoriesRecordBuilder() {
    WorkoutCategoriesRecord._initializeBuilder(this);
  }

  WorkoutCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _priority = $v.priority;
      _category = $v.category;
      _imageUrl = $v.imageUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkoutCategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkoutCategoriesRecord;
  }

  @override
  void update(void Function(WorkoutCategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkoutCategoriesRecord build() => _build();

  _$WorkoutCategoriesRecord _build() {
    final _$result = _$v ??
        new _$WorkoutCategoriesRecord._(
            priority: priority,
            category: category,
            imageUrl: imageUrl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
