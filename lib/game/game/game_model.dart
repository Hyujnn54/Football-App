import '/backend/backend.dart';
import '/components/drawer/drawer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'game_widget.dart' show GameWidget;
import 'package:flutter/material.dart';

class GameModel extends FlutterFlowModel<GameWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamRecord? team2Id;
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
