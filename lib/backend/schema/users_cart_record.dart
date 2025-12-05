import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersCartRecord extends FirestoreRecord {
  UsersCartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "current_price" field.
  double? _currentPrice;
  double get currentPrice => _currentPrice ?? 0.0;
  bool hasCurrentPrice() => _currentPrice != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _currentPrice = castToType<double>(snapshotData['current_price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('users_cart')
          : FirebaseFirestore.instance.collectionGroup('users_cart');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('users_cart').doc(id);

  static Stream<UsersCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersCartRecord.fromSnapshot(s));

  static Future<UsersCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersCartRecord.fromSnapshot(s));

  static UsersCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersCartRecordData({
  DocumentReference? productRef,
  int? quantity,
  double? currentPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_ref': productRef,
      'quantity': quantity,
      'current_price': currentPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersCartRecordDocumentEquality implements Equality<UsersCartRecord> {
  const UsersCartRecordDocumentEquality();

  @override
  bool equals(UsersCartRecord? e1, UsersCartRecord? e2) {
    return e1?.productRef == e2?.productRef &&
        e1?.quantity == e2?.quantity &&
        e1?.currentPrice == e2?.currentPrice;
  }

  @override
  int hash(UsersCartRecord? e) =>
      const ListEquality().hash([e?.productRef, e?.quantity, e?.currentPrice]);

  @override
  bool isValidKey(Object? o) => o is UsersCartRecord;
}
