import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'myfeedback_widget.dart' show MyfeedbackWidget;
import 'package:flutter/material.dart';

class MyfeedbackModel extends FlutterFlowModel<MyfeedbackWidget> {
  ///  State fields for stateful widgets in this page.

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
