import '/flutter_flow/flutter_flow_util.dart';
import 'stats_widget.dart' show StatsWidget;
import 'package:flutter/material.dart';

class StatsModel extends FlutterFlowModel<StatsWidget> {
  ///  Local state fields for this component.

  List<String> chartLabels = [];
  void addToChartLabels(String item) => chartLabels.add(item);
  void removeFromChartLabels(String item) => chartLabels.remove(item);
  void removeAtIndexFromChartLabels(int index) => chartLabels.removeAt(index);
  void insertAtIndexInChartLabels(int index, String item) =>
      chartLabels.insert(index, item);
  void updateChartLabelsAtIndex(int index, Function(String) updateFn) =>
      chartLabels[index] = updateFn(chartLabels[index]);

  List<int> chartValues = [];
  void addToChartValues(int item) => chartValues.add(item);
  void removeFromChartValues(int item) => chartValues.remove(item);
  void removeAtIndexFromChartValues(int index) => chartValues.removeAt(index);
  void insertAtIndexInChartValues(int index, int item) =>
      chartValues.insert(index, item);
  void updateChartValuesAtIndex(int index, Function(int) updateFn) =>
      chartValues[index] = updateFn(chartValues[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
