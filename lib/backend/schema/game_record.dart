import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameRecord extends FirestoreRecord {
  GameRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "game_id" field.
  String? _gameId;
  String get gameId => _gameId ?? '';
  bool hasGameId() => _gameId != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "team1_id" field.
  DocumentReference? _team1Id;
  DocumentReference? get team1Id => _team1Id;
  bool hasTeam1Id() => _team1Id != null;

  // "team2_id" field.
  DocumentReference? _team2Id;
  DocumentReference? get team2Id => _team2Id;
  bool hasTeam2Id() => _team2Id != null;

  void _initializeFields() {
    _gameId = snapshotData['game_id'] as String?;
    _location = snapshotData['location'] as String?;
    _dateTime = snapshotData['date_time'] as DateTime?;
    _team1Id = snapshotData['team1_id'] as DocumentReference?;
    _team2Id = snapshotData['team2_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('game');

  static Stream<GameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GameRecord.fromSnapshot(s));

  static Future<GameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GameRecord.fromSnapshot(s));

  static GameRecord fromSnapshot(DocumentSnapshot snapshot) => GameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGameRecordData({
  String? gameId,
  String? location,
  DateTime? dateTime,
  DocumentReference? team1Id,
  DocumentReference? team2Id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'game_id': gameId,
      'location': location,
      'date_time': dateTime,
      'team1_id': team1Id,
      'team2_id': team2Id,
    }.withoutNulls,
  );

  return firestoreData;
}

class GameRecordDocumentEquality implements Equality<GameRecord> {
  const GameRecordDocumentEquality();

  @override
  bool equals(GameRecord? e1, GameRecord? e2) {
    return e1?.gameId == e2?.gameId &&
        e1?.location == e2?.location &&
        e1?.dateTime == e2?.dateTime &&
        e1?.team1Id == e2?.team1Id &&
        e1?.team2Id == e2?.team2Id;
  }

  @override
  int hash(GameRecord? e) => const ListEquality()
      .hash([e?.gameId, e?.location, e?.dateTime, e?.team1Id, e?.team2Id]);

  @override
  bool isValidKey(Object? o) => o is GameRecord;
}
