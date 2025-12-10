import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "edited" field.
  bool? _edited;
  bool get edited => _edited ?? false;
  bool hasEdited() => _edited != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _edited = snapshotData['edited'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? senderRef,
  String? text,
  DateTime? timestamp,
  bool? edited,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender_ref': senderRef,
      'text': text,
      'timestamp': timestamp,
      'edited': edited,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.senderRef == e2?.senderRef &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.edited == e2?.edited;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality()
      .hash([e?.senderRef, e?.text, e?.timestamp, e?.edited]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
