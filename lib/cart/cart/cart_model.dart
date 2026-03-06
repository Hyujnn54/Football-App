import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  double? cartTotal = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SimulatePayment)] action in Button widget.
  ApiCallResponse? paymentResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
