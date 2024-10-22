import 'package:hive/hive.dart';

class HiveManager {
  Box _getBox() => Hive.box<dynamic>('Amity');

  ///to save a value

  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }

  ///to get that saved value.

  String getStringValue(String key) {
    var box = _getBox();
    var value = box.get(key) as String? ?? '';
    return value;
  }

  ///to get that saved value.
  String getDynamicValue(dynamic key) {
    var box = _getBox();
    var value = box.get(key);
    return value;
  }

  /// clear all data

  void clearBox() async {
    await _getBox().clear();
  }

  void saveAllValue(Map<dynamic, dynamic> entries) async {
    await _getBox().putAll(entries);
  }
}
