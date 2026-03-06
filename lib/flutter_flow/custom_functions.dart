import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double calculateCartTotal(List<UsersCartRecord> cartItems) {
  double total = 0.0;

  // Loop through each item in the cart
  for (var item in cartItems) {
    // Multiply price by quantity.
    // We use "?? 0" to handle cases where a value might be missing (null safety)
    double price = item.currentPrice ?? 0.0;
    int quantity = item.quantity ?? 0;

    total += (price * quantity);
  }

  return total;
}

List<String> uniqueLocations(List<String>? locations) {
  final Set<String> uniqueSet = {};
  final List<String> result = [];

  for (final location in locations ?? []) {
    if (location != null && location.trim().isNotEmpty) {
      final trimmed = location.trim();
      final normalized = trimmed.toLowerCase();

      if (!uniqueSet.contains(normalized)) {
        uniqueSet.add(normalized);
        result.add(trimmed);
      }
    }
  }

  return result;
}

List<int> countsForLocations(
  List<String>? allLocations,
  List<String> labels,
) {
  final cleanedAll = (allLocations ?? [])
      .where((e) => e != null && e.trim().isNotEmpty)
      .map((e) => e!.trim().toLowerCase())
      .toList();

  final cleanedLabels = labels.map((e) => e.trim().toLowerCase()).toList();

  final result = <int>[];

  for (final key in cleanedLabels) {
    final count = cleanedAll.where((x) => x == key).length;
    result.add(count);
  }

  return result;
}

int closestForecastIndex(
  List<int> dtList,
  DateTime matchDateTime,
) {
  if (dtList.isEmpty) return 0;

  final matchUtcSeconds =
      (matchDateTime.toUtc().millisecondsSinceEpoch / 1000).round();

  int bestIndex = 0;
  int bestDiff = (dtList[0] - matchUtcSeconds).abs();

  for (int i = 1; i < dtList.length; i++) {
    final diff = (dtList[i] - matchUtcSeconds).abs();
    if (diff < bestDiff) {
      bestDiff = diff;
      bestIndex = i;
    }
  }
  return bestIndex;
}
