import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  bool hasChatId() => _chatId != null;

  // "members" field.
  List<String>? _members;
  List<String> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  void _initializeFields() {
    _chatId = snapshotData['chat_id'] as String?;
    _members = getDataList(snapshotData['members']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? chatId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_id': chatId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chatId == e2?.chatId &&
        listEquality.equals(e1?.members, e2?.members);
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([e?.chatId, e?.members]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
