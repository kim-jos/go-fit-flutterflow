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
    value = object.ballet;
    if (value != null) {
      result
        ..add('ballet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.climbing;
    if (value != null) {
      result
        ..add('climbing')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.crossfit;
    if (value != null) {
      result
        ..add('crossfit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dance;
    if (value != null) {
      result
        ..add('dance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.martialArts;
    if (value != null) {
      result
        ..add('martialArts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pilates;
    if (value != null) {
      result
        ..add('pilates')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.spinning;
    if (value != null) {
      result
        ..add('spinning')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.squash;
    if (value != null) {
      result
        ..add('squash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.yoga;
    if (value != null) {
      result
        ..add('yoga')
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
        case 'ballet':
          result.ballet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'climbing':
          result.climbing = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'crossfit':
          result.crossfit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dance':
          result.dance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'martialArts':
          result.martialArts = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pilates':
          result.pilates = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'spinning':
          result.spinning = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'squash':
          result.squash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'yoga':
          result.yoga = serializers.deserialize(value,
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
  final String? ballet;
  @override
  final String? climbing;
  @override
  final String? crossfit;
  @override
  final String? dance;
  @override
  final String? martialArts;
  @override
  final String? pilates;
  @override
  final String? spinning;
  @override
  final String? squash;
  @override
  final String? yoga;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WorkoutCategoriesRecord(
          [void Function(WorkoutCategoriesRecordBuilder)? updates]) =>
      (new WorkoutCategoriesRecordBuilder()..update(updates))._build();

  _$WorkoutCategoriesRecord._(
      {this.ballet,
      this.climbing,
      this.crossfit,
      this.dance,
      this.martialArts,
      this.pilates,
      this.spinning,
      this.squash,
      this.yoga,
      this.ffRef})
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
        ballet == other.ballet &&
        climbing == other.climbing &&
        crossfit == other.crossfit &&
        dance == other.dance &&
        martialArts == other.martialArts &&
        pilates == other.pilates &&
        spinning == other.spinning &&
        squash == other.squash &&
        yoga == other.yoga &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ballet.hashCode);
    _$hash = $jc(_$hash, climbing.hashCode);
    _$hash = $jc(_$hash, crossfit.hashCode);
    _$hash = $jc(_$hash, dance.hashCode);
    _$hash = $jc(_$hash, martialArts.hashCode);
    _$hash = $jc(_$hash, pilates.hashCode);
    _$hash = $jc(_$hash, spinning.hashCode);
    _$hash = $jc(_$hash, squash.hashCode);
    _$hash = $jc(_$hash, yoga.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkoutCategoriesRecord')
          ..add('ballet', ballet)
          ..add('climbing', climbing)
          ..add('crossfit', crossfit)
          ..add('dance', dance)
          ..add('martialArts', martialArts)
          ..add('pilates', pilates)
          ..add('spinning', spinning)
          ..add('squash', squash)
          ..add('yoga', yoga)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WorkoutCategoriesRecordBuilder
    implements
        Builder<WorkoutCategoriesRecord, WorkoutCategoriesRecordBuilder> {
  _$WorkoutCategoriesRecord? _$v;

  String? _ballet;
  String? get ballet => _$this._ballet;
  set ballet(String? ballet) => _$this._ballet = ballet;

  String? _climbing;
  String? get climbing => _$this._climbing;
  set climbing(String? climbing) => _$this._climbing = climbing;

  String? _crossfit;
  String? get crossfit => _$this._crossfit;
  set crossfit(String? crossfit) => _$this._crossfit = crossfit;

  String? _dance;
  String? get dance => _$this._dance;
  set dance(String? dance) => _$this._dance = dance;

  String? _martialArts;
  String? get martialArts => _$this._martialArts;
  set martialArts(String? martialArts) => _$this._martialArts = martialArts;

  String? _pilates;
  String? get pilates => _$this._pilates;
  set pilates(String? pilates) => _$this._pilates = pilates;

  String? _spinning;
  String? get spinning => _$this._spinning;
  set spinning(String? spinning) => _$this._spinning = spinning;

  String? _squash;
  String? get squash => _$this._squash;
  set squash(String? squash) => _$this._squash = squash;

  String? _yoga;
  String? get yoga => _$this._yoga;
  set yoga(String? yoga) => _$this._yoga = yoga;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WorkoutCategoriesRecordBuilder() {
    WorkoutCategoriesRecord._initializeBuilder(this);
  }

  WorkoutCategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ballet = $v.ballet;
      _climbing = $v.climbing;
      _crossfit = $v.crossfit;
      _dance = $v.dance;
      _martialArts = $v.martialArts;
      _pilates = $v.pilates;
      _spinning = $v.spinning;
      _squash = $v.squash;
      _yoga = $v.yoga;
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
            ballet: ballet,
            climbing: climbing,
            crossfit: crossfit,
            dance: dance,
            martialArts: martialArts,
            pilates: pilates,
            spinning: spinning,
            squash: squash,
            yoga: yoga,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
