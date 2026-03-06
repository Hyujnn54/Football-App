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

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  bool hasUserId() => _userId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "joinCode" field.
  String? _joinCode;
  String get joinCode => _joinCode ?? '';
  bool hasJoinCode() => _joinCode != null;

  // "players" field.
  List<DocumentReference>? _players;
  List<DocumentReference> get players => _players ?? const [];
  bool hasPlayers() => _players != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "wins" field.
  int? _wins;
  int get wins => _wins ?? 0;
  bool hasWins() => _wins != null;

  // "loses" field.
  int? _loses;
  int get loses => _loses ?? 0;
  bool hasLoses() => _loses != null;

  void _initializeFields() {
    _teamId = snapshotData['team_id'] as String?;
    _teamName = snapshotData['team_name'] as String?;
    _teamLogo = snapshotData['team_logo'] as String?;
    _creatorId = snapshotData['creator_id'] as DocumentReference?;
    _userId = castToType<int>(snapshotData['user_id']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _joinCode = snapshotData['joinCode'] as String?;
    _players = getDataList(snapshotData['players']);
    _country = snapshotData['country'] as String?;
    _description = snapshotData['description'] as String?;
    _wins = castToType<int>(snapshotData['wins']);
    _loses = castToType<int>(snapshotData['loses']);
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
  int? userId,
  DateTime? createdAt,
  String? joinCode,
  String? country,
  String? description,
  int? wins,
  int? loses,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'team_id': teamId,
      'team_name': teamName,
      'team_logo': teamLogo,
      'creator_id': creatorId,
      'user_id': userId,
      'created_at': createdAt,
      'joinCode': joinCode,
      'country': country,
      'description': description,
      'wins': wins,
      'loses': loses,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamRecordDocumentEquality implements Equality<TeamRecord> {
  const TeamRecordDocumentEquality();

  @override
  bool equals(TeamRecord? e1, TeamRecord? e2) {
    const listEquality = ListEquality();
    return e1?.teamId == e2?.teamId &&
        e1?.teamName == e2?.teamName &&
        e1?.teamLogo == e2?.teamLogo &&
        e1?.creatorId == e2?.creatorId &&
        e1?.userId == e2?.userId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.joinCode == e2?.joinCode &&
        listEquality.equals(e1?.players, e2?.players) &&
        e1?.country == e2?.country &&
        e1?.description == e2?.description &&
        e1?.wins == e2?.wins &&
        e1?.loses == e2?.loses;
  }

  @override
  int hash(TeamRecord? e) => const ListEquality().hash([
        e?.teamId,
        e?.teamName,
        e?.teamLogo,
        e?.creatorId,
        e?.userId,
        e?.createdAt,
        e?.joinCode,
        e?.players,
        e?.country,
        e?.description,
        e?.wins,
        e?.loses
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamRecord;
}
