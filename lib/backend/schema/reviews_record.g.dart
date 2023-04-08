// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReviewsRecord> _$reviewsRecordSerializer =
    new _$ReviewsRecordSerializer();

class _$ReviewsRecordSerializer implements StructuredSerializer<ReviewsRecord> {
  @override
  final Iterable<Type> types = const [ReviewsRecord, _$ReviewsRecord];
  @override
  final String wireName = 'ReviewsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReviewsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.classRef;
    if (value != null) {
      result
        ..add('classRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reservationRef;
    if (value != null) {
      result
        ..add('reservationRef')
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
  ReviewsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'classRef':
          result.classRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'reservationRef':
          result.reservationRef = serializers.deserialize(value,
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

class _$ReviewsRecord extends ReviewsRecord {
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? classRef;
  @override
  final DateTime? createdAt;
  @override
  final String? review;
  @override
  final int? rating;
  @override
  final DocumentReference<Object?>? reservationRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReviewsRecord([void Function(ReviewsRecordBuilder)? updates]) =>
      (new ReviewsRecordBuilder()..update(updates))._build();

  _$ReviewsRecord._(
      {this.userRef,
      this.classRef,
      this.createdAt,
      this.review,
      this.rating,
      this.reservationRef,
      this.ffRef})
      : super._();

  @override
  ReviewsRecord rebuild(void Function(ReviewsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewsRecordBuilder toBuilder() => new ReviewsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewsRecord &&
        userRef == other.userRef &&
        classRef == other.classRef &&
        createdAt == other.createdAt &&
        review == other.review &&
        rating == other.rating &&
        reservationRef == other.reservationRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, classRef.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, reservationRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewsRecord')
          ..add('userRef', userRef)
          ..add('classRef', classRef)
          ..add('createdAt', createdAt)
          ..add('review', review)
          ..add('rating', rating)
          ..add('reservationRef', reservationRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReviewsRecordBuilder
    implements Builder<ReviewsRecord, ReviewsRecordBuilder> {
  _$ReviewsRecord? _$v;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _classRef;
  DocumentReference<Object?>? get classRef => _$this._classRef;
  set classRef(DocumentReference<Object?>? classRef) =>
      _$this._classRef = classRef;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  DocumentReference<Object?>? _reservationRef;
  DocumentReference<Object?>? get reservationRef => _$this._reservationRef;
  set reservationRef(DocumentReference<Object?>? reservationRef) =>
      _$this._reservationRef = reservationRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReviewsRecordBuilder() {
    ReviewsRecord._initializeBuilder(this);
  }

  ReviewsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _classRef = $v.classRef;
      _createdAt = $v.createdAt;
      _review = $v.review;
      _rating = $v.rating;
      _reservationRef = $v.reservationRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReviewsRecord;
  }

  @override
  void update(void Function(ReviewsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewsRecord build() => _build();

  _$ReviewsRecord _build() {
    final _$result = _$v ??
        new _$ReviewsRecord._(
            userRef: userRef,
            classRef: classRef,
            createdAt: createdAt,
            review: review,
            rating: rating,
            reservationRef: reservationRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
