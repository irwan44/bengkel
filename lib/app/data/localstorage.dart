import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LocalStorages {
  static GetStorage boxToken = GetStorage('token-mekanik');

  static Future<bool> hasToken() async {
    String token = await getToken;
    return token.isNotEmpty;
  }

  static Future<void> setToken(String token) async {
    await boxToken.write('token', token);
    Publics.controller.getToken.value = LocalStorages.getToken;
  }

  static String get getToken => boxToken.read('token') ?? '';

  static Future<void> deleteToken() async {
    await boxToken.remove('token');
    Publics.controller.getToken.value = ''; // Set nilai token kosong setelah dihapus
  }

  static Future<void> logout() async {
    await deleteToken(); // Panggil fungsi deleteToken
    // Tambahkan kode lain yang perlu dijalankan saat logout, jika ada
  }
}

class Publics {
  static final controller = PublicController();
}

class PublicController extends GetxController {
  var getToken = ''.obs;
}
