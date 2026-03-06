import '/flutter_flow/flutter_flow_util.dart';
import 'feedbackstats_widget.dart' show FeedbackstatsWidget;
import 'package:flutter/material.dart';

class FeedbackstatsModel extends FlutterFlowModel<FeedbackstatsWidget> {
  ///  Local state fields for this page.

  int? numberPositive = 0;

  int? numberWeakPositive = 0;

  int? numberNeutral = 0;

  int? numberWeakNegative = 0;

  int? numberNegative = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in feedbackstats widget.
  int? positiveQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in feedbackstats widget.
  int? weakPositiveQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in feedbackstats widget.
  int? neutralQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in feedbackstats widget.
  int? weakNegativeQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in feedbackstats widget.
  int? negativeQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
