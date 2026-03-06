import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "feedback_id" field.
  String? _feedbackId;
  String get feedbackId => _feedbackId ?? '';
  bool hasFeedbackId() => _feedbackId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date_submitted" field.
  DateTime? _dateSubmitted;
  DateTime? get dateSubmitted => _dateSubmitted;
  bool hasDateSubmitted() => _dateSubmitted != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "reponse" field.
  String? _reponse;
  String get reponse => _reponse ?? '';
  bool hasReponse() => _reponse != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "sentiment" field.
  String? _sentiment;
  String get sentiment => _sentiment ?? '';
  bool hasSentiment() => _sentiment != null;

  void _initializeFields() {
    _feedbackId = snapshotData['feedback_id'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _dateSubmitted = snapshotData['date_submitted'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _subject = snapshotData['subject'] as String?;
    _description = snapshotData['description'] as String?;
    _reponse = snapshotData['reponse'] as String?;
    _status = snapshotData['status'] as String?;
    _sentiment = snapshotData['sentiment'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  String? feedbackId,
  String? userId,
  DateTime? dateSubmitted,
  String? email,
  String? subject,
  String? description,
  String? reponse,
  String? status,
  String? sentiment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feedback_id': feedbackId,
      'user_id': userId,
      'date_submitted': dateSubmitted,
      'email': email,
      'subject': subject,
      'description': description,
      'reponse': reponse,
      'status': status,
      'sentiment': sentiment,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.feedbackId == e2?.feedbackId &&
        e1?.userId == e2?.userId &&
        e1?.dateSubmitted == e2?.dateSubmitted &&
        e1?.email == e2?.email &&
        e1?.subject == e2?.subject &&
        e1?.description == e2?.description &&
        e1?.reponse == e2?.reponse &&
        e1?.status == e2?.status &&
        e1?.sentiment == e2?.sentiment;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.feedbackId,
        e?.userId,
        e?.dateSubmitted,
        e?.email,
        e?.subject,
        e?.description,
        e?.reponse,
        e?.status,
        e?.sentiment
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
