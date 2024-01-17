import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// 保存されているデータの設定
class DataStorage {
  static const String kDataKey = 'saved_data';
  // データのセーブの設定
  Future<void> saveData(List<Map<String, dynamic>> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = data.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList(kDataKey, jsonList);
  }
  // データの取得
  Future<List<Map<String, dynamic>>> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDataKey);
    if (jsonList != null) {
      final List<Map<String, dynamic>> data = jsonList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
      return data;
    }
    return [];
  }
// データの削除処理
  Future<void> deleteData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDataKey);
    if (jsonList != null) {
      final List<Map<String, dynamic>> data = jsonList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
      final updatedData = data.where((item) => item['id'] != id).toList();
      final updatedJsonList =
          updatedData.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList(kDataKey, updatedJsonList);
    }
  }
// データの全てを削除
  Future<void> deleteAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
// データの編集
  Future<void> editData(String id, String newData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDataKey);
    if (jsonList != null) {
      final List<Map<String, dynamic>> data = jsonList.map((item) {
        return jsonDecode(item) as Map<String, dynamic>;
      }).toList();
      final updatedData = data.map((item) {
        if (item['id'] == id) {
          return {...item, 'title': newData};
        }
        return item;
      }).toList();
      final updatedJsonList =
          updatedData.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList(kDataKey, updatedJsonList);
    }
  }
}

class MyPromptDataStorage {
  String key1 = "MyPrompt";
  String key2 = "MyPromptProfile";
  // データを保存
  saveValues(String value1, String value2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key1, value1);
    prefs.setString(key2, value2);
  }

// 2つの値を読み込み
  Future<Map<String, String>> loadValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value1 = prefs.getString(key1) ?? '';
    String value2 = prefs.getString(key2) ?? '';
    return {key1: value1, key2: value2};
  }
}
