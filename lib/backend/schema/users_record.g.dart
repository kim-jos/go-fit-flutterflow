// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currCredits;
    if (value != null) {
      result
        ..add('currCredits')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.admin;
    if (value != null) {
      result
        ..add('admin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expirationDate;
    if (value != null) {
      result
        ..add('expirationDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.referralCount;
    if (value != null) {
      result
        ..add('referralCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.referralCode;
    if (value != null) {
      result
        ..add('referralCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.referralBy;
    if (value != null) {
      result
        ..add('referralBy')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currCredits':
          result.currCredits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'admin':
          result.admin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expirationDate':
          result.expirationDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'referralCount':
          result.referralCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'referralCode':
          result.referralCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'referralBy':
          result.referralBy = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final int? currCredits;
  @override
  final bool? admin;
  @override
  final DateTime? expirationDate;
  @override
  final int? referralCount;
  @override
  final String? referralCode;
  @override
  final String? referralBy;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.currCredits,
      this.admin,
      this.expirationDate,
      this.referralCount,
      this.referralCode,
      this.referralBy,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        currCredits == other.currCredits &&
        admin == other.admin &&
        expirationDate == other.expirationDate &&
        referralCount == other.referralCount &&
        referralCode == other.referralCode &&
        referralBy == other.referralBy &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, currCredits.hashCode);
    _$hash = $jc(_$hash, admin.hashCode);
    _$hash = $jc(_$hash, expirationDate.hashCode);
    _$hash = $jc(_$hash, referralCount.hashCode);
    _$hash = $jc(_$hash, referralCode.hashCode);
    _$hash = $jc(_$hash, referralBy.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('currCredits', currCredits)
          ..add('admin', admin)
          ..add('expirationDate', expirationDate)
          ..add('referralCount', referralCount)
          ..add('referralCode', referralCode)
          ..add('referralBy', referralBy)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  int? _currCredits;
  int? get currCredits => _$this._currCredits;
  set currCredits(int? currCredits) => _$this._currCredits = currCredits;

  bool? _admin;
  bool? get admin => _$this._admin;
  set admin(bool? admin) => _$this._admin = admin;

  DateTime? _expirationDate;
  DateTime? get expirationDate => _$this._expirationDate;
  set expirationDate(DateTime? expirationDate) =>
      _$this._expirationDate = expirationDate;

  int? _referralCount;
  int? get referralCount => _$this._referralCount;
  set referralCount(int? referralCount) =>
      _$this._referralCount = referralCount;

  String? _referralCode;
  String? get referralCode => _$this._referralCode;
  set referralCode(String? referralCode) => _$this._referralCode = referralCode;

  String? _referralBy;
  String? get referralBy => _$this._referralBy;
  set referralBy(String? referralBy) => _$this._referralBy = referralBy;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _currCredits = $v.currCredits;
      _admin = $v.admin;
      _expirationDate = $v.expirationDate;
      _referralCount = $v.referralCount;
      _referralCode = $v.referralCode;
      _referralBy = $v.referralBy;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            currCredits: currCredits,
            admin: admin,
            expirationDate: expirationDate,
            referralCount: referralCount,
            referralCode: referralCode,
            referralBy: referralBy,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
