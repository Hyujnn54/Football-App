import '/backend/backend.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'shop1_widget.dart' show Shop1Widget;
import 'package:flutter/material.dart';

class Shop1Model extends FlutterFlowModel<Shop1Widget> {
  ///  Local state fields for this page.

  String searchQuery = 'none';

  List<String> selectedCategories = [];
  void addToSelectedCategories(String item) => selectedCategories.add(item);
  void removeFromSelectedCategories(String item) =>
      selectedCategories.remove(item);
  void removeAtIndexFromSelectedCategories(int index) =>
      selectedCategories.removeAt(index);
  void insertAtIndexInSelectedCategories(int index, String item) =>
      selectedCategories.insert(index, item);
  void updateSelectedCategoriesAtIndex(int index, Function(String) updateFn) =>
      selectedCategories[index] = updateFn(selectedCategories[index]);

  String productSortDirection = 'asc';

  List<String> selectedColor = [];
  void addToSelectedColor(String item) => selectedColor.add(item);
  void removeFromSelectedColor(String item) => selectedColor.remove(item);
  void removeAtIndexFromSelectedColor(int index) =>
      selectedColor.removeAt(index);
  void insertAtIndexInSelectedColor(int index, String item) =>
      selectedColor.insert(index, item);
  void updateSelectedColorAtIndex(int index, Function(String) updateFn) =>
      selectedColor[index] = updateFn(selectedColor[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersCartRecord? existingproduct;
  // Model for drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    drawerModel.dispose();
  }
}
