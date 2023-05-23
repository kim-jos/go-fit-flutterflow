import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_sent_by" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "last_message_seen_by" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "timeSlotRef" field.
  DocumentReference? _timeSlotRef;
  DocumentReference? get timeSlotRef => _timeSlotRef;
  bool hasTimeSlotRef() => _timeSlotRef != null;

  // "timeSlotDate" field.
  String? _timeSlotDate;
  String get timeSlotDate => _timeSlotDate ?? '';
  bool hasTimeSlotDate() => _timeSlotDate != null;

  // "maxUsers" field.
  int? _maxUsers;
  int get maxUsers => _maxUsers ?? 0;
  bool hasMaxUsers() => _maxUsers != null;

  // "isTimeSlotChatGroup" field.
  bool? _isTimeSlotChatGroup;
  bool get isTimeSlotChatGroup => _isTimeSlotChatGroup ?? false;
  bool hasIsTimeSlotChatGroup() => _isTimeSlotChatGroup != null;

  // "className" field.
  String? _className;
  String get className => _className ?? '';
  bool hasClassName() => _className != null;

  // "classTime" field.
  String? _classTime;
  String get classTime => _classTime ?? '';
  bool hasClassTime() => _classTime != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageSentBy =
        snapshotData['last_message_sent_by'] as DocumentReference?;
    _lastMessageSeenBy = getDataList(snapshotData['last_message_seen_by']);
    _timeSlotRef = snapshotData['timeSlotRef'] as DocumentReference?;
    _timeSlotDate = snapshotData['timeSlotDate'] as String?;
    _maxUsers = snapshotData['maxUsers'] as int?;
    _isTimeSlotChatGroup = snapshotData['isTimeSlotChatGroup'] as bool?;
    _className = snapshotData['className'] as String?;
    _classTime = snapshotData['classTime'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? userA,
  DocumentReference? userB,
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  DocumentReference? timeSlotRef,
  String? timeSlotDate,
  int? maxUsers,
  bool? isTimeSlotChatGroup,
  String? className,
  String? classTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_a': userA,
      'user_b': userB,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'last_message_sent_by': lastMessageSentBy,
      'timeSlotRef': timeSlotRef,
      'timeSlotDate': timeSlotDate,
      'maxUsers': maxUsers,
      'isTimeSlotChatGroup': isTimeSlotChatGroup,
      'className': className,
      'classTime': classTime,
    }.withoutNulls,
  );

  return firestoreData;
}
