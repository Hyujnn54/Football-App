import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_match_widget.dart' show CreateMatchWidget;
import 'package:flutter/material.dart';

class CreateMatchModel extends FlutterFlowModel<CreateMatchWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TeamRecord? team1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
