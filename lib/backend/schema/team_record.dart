import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamRecord extends FirestoreRecord {
  TeamRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "team_id" field.
  String? _teamId;
  String get teamId => _teamId ?? '';
  bool hasTeamId() => _teamId != null;

  // "team_name" field.
  String? _teamName;
  String get teamName => _teamName ?? '';
  bool hasTeamName() => _teamName != null;

  // "team_logo" field.
  String? _teamLogo;
  String get teamLogo => _teamLogo ?? '';
  bool hasTeamLogo() => _teamLogo != null;

  // "creator_id" field.
  DocumentReference? _creatorId;
  DocumentReference? get creatorId => _creatorId;
  bool hasCreatorId() => _creatorId != null;

  void _initializeFields() {
    _teamId = snapshotData['team_id'] as String?;
    _teamName = snapshotData['team_name'] as String?;
    _teamLogo = snapshotData['team_logo'] as String?;
    _creatorId = snapshotData['creator_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Team');

  static Stream<TeamRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamRecord.fromSnapshot(s));

  static Future<TeamRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamRecord.fromSnapshot(s));

  static TeamRecord fromSnapshot(DocumentSnapshot snapshot) => TeamRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamRecordData({
  String? teamId,
  String? teamName,
  String? teamLogo,
  DocumentReference? creatorId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'team_id': teamId,
      'team_name': teamName,
      'team_logo': teamLogo,
      'creator_id': creatorId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamRecordDocumentEquality implements Equality<TeamRecord> {
  const TeamRecordDocumentEquality();

  @override
  bool equals(TeamRecord? e1, TeamRecord? e2) {
    return e1?.teamId == e2?.teamId &&
        e1?.teamName == e2?.teamName &&
        e1?.teamLogo == e2?.teamLogo &&
        e1?.creatorId == e2?.creatorId;
  }

  @override
  int hash(TeamRecord? e) => const ListEquality()
      .hash([e?.teamId, e?.teamName, e?.teamLogo, e?.creatorId]);

  @override
  bool isValidKey(Object? o) => o is TeamRecord;
}
