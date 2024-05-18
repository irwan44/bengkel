import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';import 'package:customer_bengkelly/app/data/publik.dart';
import 'package:customer_bengkelly/app/modules/profile/componen/pilih_kendaraan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../componen/color.dart';
import '../modules/news/componen/todaydeals.dart';
import '../routes/app_pages.dart';
import 'data_endpoint/customkendaraan.dart';
import 'data_endpoint/kategorikendaraan.dart';
import 'data_endpoint/login.dart';
import 'data_endpoint/merekkendaraan.dart';
import 'data_endpoint/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_endpoint/profile.dart';
import 'data_endpoint/register.dart';
import 'data_endpoint/tipekendaraan.dart';
import 'localstorage.dart';

class API {
  //News ----------------------------------------------------------------------------------
  static const _bengkellyUrl = 'https://bengkelly.co.id/wp-json/wp/v2/posts';
  static const _fleetMaintenanceUrl = 'https://fleetmaintenance.co.id/wp-json/wp/v2/posts';
  static const _katagorikendaraan = 'https://api-vale.techthinkhub.com/api/kategori-kendaraan';
  //API ------------------------------------------------------------------------------------
  static const _url = 'https://mobile.techthinkhub.id';
  static const _urlbe = 'https://be.techthinkhub.id';
  static const _baseUrl = '$_url/api';
  static const _PostLogin = '$_baseUrl/customer/login';
  static const _Getprofile = '$_baseUrl/customer-get-profile';
  static const _PostRegister = '$_baseUrl/register-kendaraan';
  static const _postCreateBooking = '$_baseUrl/booking/book-rest-area';
  static const _GetLokasi = '$_baseUrl/get-lokasi';
  static const _GetHistory = '$_baseUrl/history';
  static const _GetGeneralCheckup = '$_baseUrl/general-checkup';
  static const _GetEmergencyService = '$_baseUrl/emergency-service';
  static const _GetMerek = '$_baseUrl/merk';
  static const _GetTipe = '$_baseUrl/tipe';
  static const _GetCustomKendaraan = '$_baseUrl/customer-kendaraan';


  static Future<String?> login({required String email, required String password}) async {
    final data = {
      "email": email,
      "password": password,
    };

    try {
      var response = await Dio().post(
        _PostLogin,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          if (responseData['status'] == false) {
            Get.snackbar('Error', responseData['message'],
                backgroundColor: const Color(0xffe5f3e7));
            return null;
          } else {
            String token = responseData['token'];
            LocalStorages.setToken(token); // Simpan token
            Get.snackbar('Selamat Datang', 'Pelanggan Bengkelly',
                backgroundColor:Colors.green,
                colorText: Colors.white
            );
            Get.offAllNamed(Routes.HOME);
            return token;
          }
        } else {
          print('Unexpected response format');
          throw Exception('Unexpected response format');
        }
      } else {
        print('Failed to load data, status code: ${response.statusCode}');
        throw Exception('Failed to load data, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
      throw e;
    }
  }
  //Beda
  static Future<Register> RegisterID({
    required String nama,
    required String hp,
    required String email,
    required String password,
    required String passwordconfirmation,
    required String alamat,
    required String nopolisi,
    required String idmerk,
    required String idtipe,
    required String kategorikendaraan,
    required String tahun,
    required String warna,
    required String transmisi,
  }) async {
    final data = {
      "nama": nama,
      "hp": hp,
      "email": email,
      "password": password,
      "password_confirmation": passwordconfirmation,
      "alamat": alamat,
      "no_polisi": nopolisi,
      "id_merk": idmerk,
      "id_tipe": idtipe,
      "kategori_kendaraan": kategorikendaraan,
      "tahun": tahun,
      "warna": warna,
      "transmisi": transmisi,
    };

    try {
      final token = Publics.controller.getToken.value ?? '';
      print('Token: $token');

      var response = await Dio().post(
        _PostRegister,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        Get.snackbar(
          'Hore',
          'Registrasi Akun Anda Berhasil!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan saat registrasi',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }

      final obj = Register.fromJson(response.data);

      if (obj.message == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.SINGIN);
        Get.snackbar(
          obj.message.toString(),
          obj.message.toString(),
        );
      }

      return obj;
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Gagal Registrasi',
        'Terjadi kesalahan saat registrasi',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      throw e;
    }
  }

//Beda
  static Future<MerekKendaraan> merekid() async {
    try {
      final token = Publics.controller.getToken.value ?? '';
      var data = {"token": token};
      var response = await Dio().get(
        _GetMerek,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: data,
      );

      if (response.statusCode == 404) {
        return MerekKendaraan(status: false, message: "Tidak ada data booking untuk karyawan ini.");
      }

      final obj = MerekKendaraan.fromJson(response.data);

      if (obj.message == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.SINGIN);
        Get.snackbar(
          obj.message.toString(),
          obj.message.toString(),
        );
      }

      return obj;
    } catch (e) {
      throw e;
    }
  }
  //Beda
  static Future<KategoryKendaraan> kategorykendaraanID() async {
    try {
      final token = Publics.controller.getToken.value ?? '';
      var data = {"token": token};
      var response = await Dio().get(
        _katagorikendaraan,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: data,
      );

      if (response.statusCode == 404) {
        return KategoryKendaraan(status: false, message: "Tidak ada data booking untuk karyawan ini.");
      }

      final obj = KategoryKendaraan.fromJson(response.data);

      if (obj.message == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.SINGIN);
        Get.snackbar(
          obj.message.toString(),
          obj.message.toString(),
        );
      }

      return obj;
    } catch (e) {
      throw e;
    }
  }
  //Beda
  static Future<TipeKendaraan> tipekendaraanID({required int id}) async {
    try {
      var response = await Dio().get(
        '$_GetTipe/$id', // Make sure this correctly formats the URL
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 404) {
        return TipeKendaraan(status: false, message: "Tidak ada data booking untuk karyawan ini.");
      }

      final obj = TipeKendaraan.fromJson(response.data);

      if (obj.message == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.SINGIN);
        Get.snackbar(
          obj.message.toString(),
          obj.message.toString(),
        );
      }

      return obj;
    } catch (e) {
      throw e;
    }
  }
  //Beda
  static Future<CustomerKendaraan> PilihKendaraan() async {
    try {
      final token = Publics.controller.getToken.value ?? '';
      var data = {"token": token};
      var response = await Dio().get(
        _GetCustomKendaraan,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: data,
      );

      if (response.statusCode == 404) {
        return CustomerKendaraan(status: false, message: "Tidak ada data booking untuk karyawan ini.");
      }

      final obj = CustomerKendaraan.fromJson(response.data);

      if (obj.message == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.SINGIN);
        Get.snackbar(
          obj.message.toString(),
          obj.message.toString(),
        );
      }

      return obj;
    } catch (e) {
      throw e;
    }
  }
//Beda
  static Future<Profile> profileiD() async {
    final token = Publics.controller.getToken.value ?? '';
    var data = {"token": token};
    try {
      var response = await Dio().get(
        _Getprofile,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: data,
      );

      if (response.statusCode == 404) {
        return Profile(status: false, message: "Tidak ada data booking untuk karyawan ini.");
      }

      final obj = Profile.fromJson(response.data);

      if (obj.message == 'Invalid token: Expired') {
        Get.offAllNamed(Routes.SINGIN);
        Get.snackbar(
          obj.message.toString(),
          obj.message.toString(),
        );
      }
      return obj;
    } catch (e) {
      throw e;
    }
  }
  //Beda
  static Future<List<Post>> fetchPostsFromSource({
    required String url,
    int perPage = 10,
    int page = 1,
  }) async {
    final response = await http.get(Uri.parse('$url?_embed&per_page=$perPage&page=$page'));

    if (response.statusCode == 200) {
      List<dynamic> postsJson = json.decode(response.body);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts: ${response.reasonPhrase}');
    }
  }

  static Future<List<Post>> fetchBengkellyPosts({int perPage = 10, int page = 1}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('bengkelly_posts');

    if (savedData != null && savedData.isNotEmpty) {
      List<dynamic> postsJson = json.decode(savedData);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      List<Post> posts = await fetchPostsFromSource(url: _bengkellyUrl, perPage: perPage, page: page);
      return posts;
    }
  }

  static Future<List<Post>> fetchFleetMaintenancePosts({int perPage = 10, int page = 1}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('fleet_maintenance_posts');

    if (savedData != null && savedData.isNotEmpty) {
      List<dynamic> postsJson = json.decode(savedData);
      return postsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      List<Post> posts = await fetchPostsFromSource(url: _fleetMaintenanceUrl, perPage: perPage, page: page);
      return posts;
    }
  }
}
