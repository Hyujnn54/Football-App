import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

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

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _image = snapshotData['image'] as String?;
    _color = snapshotData['color'] as String?;
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
  String? image,
  String? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProduitRecordDocumentEquality implements Equality<ProduitRecord> {
  const ProduitRecordDocumentEquality();

  @override
  bool equals(ProduitRecord? e1, ProduitRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.image == e2?.image &&
        e1?.color == e2?.color;
  }

  @override
  int hash(ProduitRecord? e) => const ListEquality().hash(
      [e?.name, e?.price, e?.description, e?.category, e?.image, e?.color]);

  @override
  bool isValidKey(Object? o) => o is ProduitRecord;
}
