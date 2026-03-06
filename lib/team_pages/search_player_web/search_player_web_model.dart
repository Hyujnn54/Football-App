import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_player_web_widget.dart' show SearchPlayerWebWidget;
import 'package:flutter/material.dart';

class SearchPlayerWebModel extends FlutterFlowModel<SearchPlayerWebWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getPlayerDetails)] action in TextField widget.
  ApiCallResponse? apiResult8ji;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
