import '/backend/backend.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'feedbackadmin_widget.dart' show FeedbackadminWidget;
import 'package:flutter/material.dart';

class FeedbackadminModel extends FlutterFlowModel<FeedbackadminWidget> {
  ///  Local state fields for this page.
  /// list of searched feedback
  List<FeedbackRecord> filteredFeedback = [];
  void addToFilteredFeedback(FeedbackRecord item) => filteredFeedback.add(item);
  void removeFromFilteredFeedback(FeedbackRecord item) =>
      filteredFeedback.remove(item);
  void removeAtIndexFromFilteredFeedback(int index) =>
      filteredFeedback.removeAt(index);
  void insertAtIndexInFilteredFeedback(int index, FeedbackRecord item) =>
      filteredFeedback.insert(index, item);
  void updateFilteredFeedbackAtIndex(
          int index, Function(FeedbackRecord) updateFn) =>
      filteredFeedback[index] = updateFn(filteredFeedback[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in feedbackadmin widget.
  List<FeedbackRecord>? onLoadFeedbackQuery;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<FeedbackRecord> simpleSearchResults = [];
  // Model for drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    drawerModel.dispose();
  }
}
