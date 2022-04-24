import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences shared;

  LocalStorage(this.shared);

  Future<void> save({required String chave, required String valor}) async {
    bool check = await shared.setString(chave, valor);
    debugPrint("save: $check");
  }

  Future<String?> read({required String chave}) async {
    String? check = shared.getString(chave);
    debugPrint("read: $check");
    return check;
  }
}
