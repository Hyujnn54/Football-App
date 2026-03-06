// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PurchasedItemStruct extends FFFirebaseStruct {
  PurchasedItemStruct({
    DocumentReference? productRef,
    int? quantity,
    double? currentPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _quantity = quantity,
        _currentPrice = currentPrice,
        super(firestoreUtilData);

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "current_price" field.
  double? _currentPrice;
  double get currentPrice => _currentPrice ?? 0.0;
  set currentPrice(double? val) => _currentPrice = val;

  void incrementCurrentPrice(double amount) =>
      currentPrice = currentPrice + amount;

  bool hasCurrentPrice() => _currentPrice != null;

  static PurchasedItemStruct fromMap(Map<String, dynamic> data) =>
      PurchasedItemStruct(
        productRef: data['product_ref'] as DocumentReference?,
        quantity: castToType<int>(data['quantity']),
        currentPrice: castToType<double>(data['current_price']),
      );

  static PurchasedItemStruct? maybeFromMap(dynamic data) => data is Map
      ? PurchasedItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_ref': _productRef,
        'quantity': _quantity,
        'current_price': _currentPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'current_price': serializeParam(
          _currentPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static PurchasedItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PurchasedItemStruct(
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produit'],
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        currentPrice: deserializeParam(
          data['current_price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PurchasedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchasedItemStruct &&
        productRef == other.productRef &&
        quantity == other.quantity &&
        currentPrice == other.currentPrice;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([productRef, quantity, currentPrice]);
}

PurchasedItemStruct createPurchasedItemStruct({
  DocumentReference? productRef,
  int? quantity,
  double? currentPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchasedItemStruct(
      productRef: productRef,
      quantity: quantity,
      currentPrice: currentPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchasedItemStruct? updatePurchasedItemStruct(
  PurchasedItemStruct? purchasedItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchasedItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchasedItemStructData(
  Map<String, dynamic> firestoreData,
  PurchasedItemStruct? purchasedItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchasedItem == null) {
    return;
  }
  if (purchasedItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchasedItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchasedItemData =
      getPurchasedItemFirestoreData(purchasedItem, forFieldValue);
  final nestedData =
      purchasedItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = purchasedItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchasedItemFirestoreData(
  PurchasedItemStruct? purchasedItem, [
  bool forFieldValue = false,
]) {
  if (purchasedItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchasedItem.toMap());

  // Add any Firestore field values
  purchasedItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchasedItemListFirestoreData(
  List<PurchasedItemStruct>? purchasedItems,
) =>
    purchasedItems
        ?.map((e) => getPurchasedItemFirestoreData(e, true))
        .toList() ??
    [];
