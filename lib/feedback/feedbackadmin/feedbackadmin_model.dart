import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'feedbackadmin_widget.dart' show FeedbackadminWidget;
import 'package:flutter/material.dart';

class FeedbackadminModel extends FlutterFlowModel<FeedbackadminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerModel.dispose();
  }
}
