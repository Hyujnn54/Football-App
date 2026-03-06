import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _searchisactive = false;
  bool get searchisactive => _searchisactive;
  set searchisactive(bool value) {
    _searchisactive = value;
  }

  String _geminiApiKey = 'AIzaSyAUowoctJpLo54rlV6LdslVZ0Enr21xRzE';
  String get geminiApiKey => _geminiApiKey;
  set geminiApiKey(String value) {
    _geminiApiKey = value;
  }

  bool _SearchActive = false;
  bool get SearchActive => _SearchActive;
  set SearchActive(bool value) {
    _SearchActive = value;
  }

  List<String> _uploadedimage = [];
  List<String> get uploadedimage => _uploadedimage;
  set uploadedimage(List<String> value) {
    _uploadedimage = value;
  }

  void addToUploadedimage(String value) {
    uploadedimage.add(value);
  }

  void removeFromUploadedimage(String value) {
    uploadedimage.remove(value);
  }

  void removeAtIndexFromUploadedimage(int index) {
    uploadedimage.removeAt(index);
  }

  void updateUploadedimageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    uploadedimage[index] = updateFn(_uploadedimage[index]);
  }

  void insertAtIndexInUploadedimage(int index, String value) {
    uploadedimage.insert(index, value);
  }
}
