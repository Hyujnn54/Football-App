import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'match_details_widget.dart' show MatchDetailsWidget;
import 'package:flutter/material.dart';

class MatchDetailsModel extends FlutterFlowModel<MatchDetailsWidget> {
  ///  Local state fields for this component.

  double? weathertemp;

  String? weatherDesc;

  String? weatherIcon;

  bool? weatherLoading = true;

  int? closestIndex;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (OpenWeatherForecast)] action in match_details widget.
  ApiCallResponse? apiResult4ca;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
