import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences shared;

  LocalStorage(this.shared);

  Future<void> save({required String chave, required String valor}) async {
    await shared.setString(chave, valor);
  }

  Future<String?> read({required String chave}) async {
    String? check = shared.getString(chave);
    return check;
  }
}
