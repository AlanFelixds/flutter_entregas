import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Local {
  late SharedPreferences _shared;

  Future<void> save({required String chave, required String valor}) async {
    _shared = await Modular.getAsync<SharedPreferences>();
    await _shared.setString(chave, valor);
  }

  Future<String?> read({required String chave}) async {
    _shared = await Modular.getAsync<SharedPreferences>();
    String? check = _shared.getString(chave);
    return check;
  }
}
