import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences _shared = Modular.get<SharedPreferences>();

  // LocalStorage(this._shared);

  Future<void> save({required String chave, required String valor}) async {
    await _shared.setString(chave, valor);
  }

  Future<String?> read({required String chave}) async {
    String? check = _shared.getString(chave);
    return check;
  }
}
