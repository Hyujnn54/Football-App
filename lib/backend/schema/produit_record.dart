import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProduitRecord extends FirestoreRecord {
  ProduitRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _images = getDataList(snapshotData['images']);
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produit');

  static Stream<ProduitRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProduitRecord.fromSnapshot(s));

  static Future<ProduitRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProduitRecord.fromSnapshot(s));

  static ProduitRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProduitRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProduitRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProduitRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProduitRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProduitRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProduitRecordData({
  String? name,
  double? price,
  String? description,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProduitRecordDocumentEquality implements Equality<ProduitRecord> {
  const ProduitRecordDocumentEquality();

  @override
  bool equals(ProduitRecord? e1, ProduitRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.category == e2?.category;
  }

  @override
  int hash(ProduitRecord? e) => const ListEquality()
      .hash([e?.name, e?.price, e?.description, e?.images, e?.category]);

  @override
  bool isValidKey(Object? o) => o is ProduitRecord;
}
