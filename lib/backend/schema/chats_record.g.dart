// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatsRecord> _$chatsRecordSerializer = new _$ChatsRecordSerializer();

class _$ChatsRecordSerializer implements StructuredSerializer<ChatsRecord> {
  @override
  final Iterable<Type> types = const [ChatsRecord, _$ChatsRecord];
  @override
  final String wireName = 'ChatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.userA;
    if (value != null) {
      result
        ..add('user_a')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userB;
    if (value != null) {
      result
        ..add('user_b')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastMessage;
    if (value != null) {
      result
        ..add('last_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastMessageTime;
    if (value != null) {
      result
        ..add('last_message_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastMessageSentBy;
    if (value != null) {
      result
        ..add('last_message_sent_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastMessageSeenBy;
    if (value != null) {
      result
        ..add('last_message_seen_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.timeSlotRef;
    if (value != null) {
      result
        ..add('timeSlotRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timeSlotDate;
    if (value != null) {
      result
        ..add('timeSlotDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.maxUsers;
    if (value != null) {
      result
        ..add('maxUsers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isTimeSlotChatGroup;
    if (value != null) {
      result
        ..add('isTimeSlotChatGroup')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.className;
    if (value != null) {
      result
        ..add('className')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.classTime;
    if (value != null) {
      result
        ..add('classTime')
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
  ChatsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'user_a':
          result.userA = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_b':
          result.userB = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_message':
          result.lastMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_message_time':
          result.lastMessageTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'last_message_sent_by':
          result.lastMessageSentBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_message_seen_by':
          result.lastMessageSeenBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'timeSlotRef':
          result.timeSlotRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'timeSlotDate':
          result.timeSlotDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'maxUsers':
          result.maxUsers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isTimeSlotChatGroup':
          result.isTimeSlotChatGroup = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'className':
          result.className = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'classTime':
          result.classTime = serializers.deserialize(value,
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

class _$ChatsRecord extends ChatsRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? users;
  @override
  final DocumentReference<Object?>? userA;
  @override
  final DocumentReference<Object?>? userB;
  @override
  final String? lastMessage;
  @override
  final DateTime? lastMessageTime;
  @override
  final DocumentReference<Object?>? lastMessageSentBy;
  @override
  final BuiltList<DocumentReference<Object?>>? lastMessageSeenBy;
  @override
  final DocumentReference<Object?>? timeSlotRef;
  @override
  final String? timeSlotDate;
  @override
  final int? maxUsers;
  @override
  final bool? isTimeSlotChatGroup;
  @override
  final String? className;
  @override
  final String? classTime;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatsRecord([void Function(ChatsRecordBuilder)? updates]) =>
      (new ChatsRecordBuilder()..update(updates))._build();

  _$ChatsRecord._(
      {this.users,
      this.userA,
      this.userB,
      this.lastMessage,
      this.lastMessageTime,
      this.lastMessageSentBy,
      this.lastMessageSeenBy,
      this.timeSlotRef,
      this.timeSlotDate,
      this.maxUsers,
      this.isTimeSlotChatGroup,
      this.className,
      this.classTime,
      this.ffRef})
      : super._();

  @override
  ChatsRecord rebuild(void Function(ChatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatsRecordBuilder toBuilder() => new ChatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatsRecord &&
        users == other.users &&
        userA == other.userA &&
        userB == other.userB &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        lastMessageSentBy == other.lastMessageSentBy &&
        lastMessageSeenBy == other.lastMessageSeenBy &&
        timeSlotRef == other.timeSlotRef &&
        timeSlotDate == other.timeSlotDate &&
        maxUsers == other.maxUsers &&
        isTimeSlotChatGroup == other.isTimeSlotChatGroup &&
        className == other.className &&
        classTime == other.classTime &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, userA.hashCode);
    _$hash = $jc(_$hash, userB.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, lastMessageTime.hashCode);
    _$hash = $jc(_$hash, lastMessageSentBy.hashCode);
    _$hash = $jc(_$hash, lastMessageSeenBy.hashCode);
    _$hash = $jc(_$hash, timeSlotRef.hashCode);
    _$hash = $jc(_$hash, timeSlotDate.hashCode);
    _$hash = $jc(_$hash, maxUsers.hashCode);
    _$hash = $jc(_$hash, isTimeSlotChatGroup.hashCode);
    _$hash = $jc(_$hash, className.hashCode);
    _$hash = $jc(_$hash, classTime.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatsRecord')
          ..add('users', users)
          ..add('userA', userA)
          ..add('userB', userB)
          ..add('lastMessage', lastMessage)
          ..add('lastMessageTime', lastMessageTime)
          ..add('lastMessageSentBy', lastMessageSentBy)
          ..add('lastMessageSeenBy', lastMessageSeenBy)
          ..add('timeSlotRef', timeSlotRef)
          ..add('timeSlotDate', timeSlotDate)
          ..add('maxUsers', maxUsers)
          ..add('isTimeSlotChatGroup', isTimeSlotChatGroup)
          ..add('className', className)
          ..add('classTime', classTime)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatsRecordBuilder implements Builder<ChatsRecord, ChatsRecordBuilder> {
  _$ChatsRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _users;
  ListBuilder<DocumentReference<Object?>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object?>>();
  set users(ListBuilder<DocumentReference<Object?>>? users) =>
      _$this._users = users;

  DocumentReference<Object?>? _userA;
  DocumentReference<Object?>? get userA => _$this._userA;
  set userA(DocumentReference<Object?>? userA) => _$this._userA = userA;

  DocumentReference<Object?>? _userB;
  DocumentReference<Object?>? get userB => _$this._userB;
  set userB(DocumentReference<Object?>? userB) => _$this._userB = userB;

  String? _lastMessage;
  String? get lastMessage => _$this._lastMessage;
  set lastMessage(String? lastMessage) => _$this._lastMessage = lastMessage;

  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _$this._lastMessageTime;
  set lastMessageTime(DateTime? lastMessageTime) =>
      _$this._lastMessageTime = lastMessageTime;

  DocumentReference<Object?>? _lastMessageSentBy;
  DocumentReference<Object?>? get lastMessageSentBy =>
      _$this._lastMessageSentBy;
  set lastMessageSentBy(DocumentReference<Object?>? lastMessageSentBy) =>
      _$this._lastMessageSentBy = lastMessageSentBy;

  ListBuilder<DocumentReference<Object?>>? _lastMessageSeenBy;
  ListBuilder<DocumentReference<Object?>> get lastMessageSeenBy =>
      _$this._lastMessageSeenBy ??=
          new ListBuilder<DocumentReference<Object?>>();
  set lastMessageSeenBy(
          ListBuilder<DocumentReference<Object?>>? lastMessageSeenBy) =>
      _$this._lastMessageSeenBy = lastMessageSeenBy;

  DocumentReference<Object?>? _timeSlotRef;
  DocumentReference<Object?>? get timeSlotRef => _$this._timeSlotRef;
  set timeSlotRef(DocumentReference<Object?>? timeSlotRef) =>
      _$this._timeSlotRef = timeSlotRef;

  String? _timeSlotDate;
  String? get timeSlotDate => _$this._timeSlotDate;
  set timeSlotDate(String? timeSlotDate) => _$this._timeSlotDate = timeSlotDate;

  int? _maxUsers;
  int? get maxUsers => _$this._maxUsers;
  set maxUsers(int? maxUsers) => _$this._maxUsers = maxUsers;

  bool? _isTimeSlotChatGroup;
  bool? get isTimeSlotChatGroup => _$this._isTimeSlotChatGroup;
  set isTimeSlotChatGroup(bool? isTimeSlotChatGroup) =>
      _$this._isTimeSlotChatGroup = isTimeSlotChatGroup;

  String? _className;
  String? get className => _$this._className;
  set className(String? className) => _$this._className = className;

  String? _classTime;
  String? get classTime => _$this._classTime;
  set classTime(String? classTime) => _$this._classTime = classTime;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatsRecordBuilder() {
    ChatsRecord._initializeBuilder(this);
  }

  ChatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _userA = $v.userA;
      _userB = $v.userB;
      _lastMessage = $v.lastMessage;
      _lastMessageTime = $v.lastMessageTime;
      _lastMessageSentBy = $v.lastMessageSentBy;
      _lastMessageSeenBy = $v.lastMessageSeenBy?.toBuilder();
      _timeSlotRef = $v.timeSlotRef;
      _timeSlotDate = $v.timeSlotDate;
      _maxUsers = $v.maxUsers;
      _isTimeSlotChatGroup = $v.isTimeSlotChatGroup;
      _className = $v.className;
      _classTime = $v.classTime;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatsRecord;
  }

  @override
  void update(void Function(ChatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatsRecord build() => _build();

  _$ChatsRecord _build() {
    _$ChatsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChatsRecord._(
              users: _users?.build(),
              userA: userA,
              userB: userB,
              lastMessage: lastMessage,
              lastMessageTime: lastMessageTime,
              lastMessageSentBy: lastMessageSentBy,
              lastMessageSeenBy: _lastMessageSeenBy?.build(),
              timeSlotRef: timeSlotRef,
              timeSlotDate: timeSlotDate,
              maxUsers: maxUsers,
              isTimeSlotChatGroup: isTimeSlotChatGroup,
              className: className,
              classTime: classTime,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();

        _$failedField = 'lastMessageSeenBy';
        _lastMessageSeenBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
