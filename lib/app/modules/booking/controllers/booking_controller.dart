import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data_endpoint/merekkendaraan.dart';
import '../../../data/data_endpoint/tipekendaraan.dart';
import '../../../data/endpoint.dart';
import '../../../routes/app_pages.dart';

class BookingController extends GetxController {
  //TODO: Implement BookingController
  var futureMerek = Future<MerekKendaraan>.value(MerekKendaraan(data: [])).obs;
  var futureTipeKendaraan = Future<TipeKendaraan>.value(TipeKendaraan(data: [])).obs;
  var selectedMerek = ''.obs;
  var selectedTipe = ''.obs;
  var selectedMerekId = 0.obs;
  var selectedTipeID = 0.obs;
  var selectedTransmisi = ''.obs;
  var selectedKategory = ''.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nopolController = TextEditingController();
  final hpController = TextEditingController();
  final warnaController = TextEditingController();
  final tahunController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadMerek();
  }

  void loadMerek() {
    futureMerek.value = API.merekid();
  }

  Future<void> register() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        nopolController.text.isNotEmpty &&
        selectedMerek.value.isNotEmpty &&
        selectedKategory.value.isNotEmpty &&
        selectedTransmisi.value.isNotEmpty &&
        tahunController.text.isNotEmpty) {
      try {
        final registerResponse = await API.RegisterID(
          nama: usernameController.text,
          hp: hpController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordconfirmation: confirmPasswordController.text,
          alamat: '-',
          nopolisi: nopolController.text,
          idmerk: selectedMerekId.value.toString(),
          idtipe: selectedTipeID.value.toString(),
          kategorikendaraan: selectedKategory.value,
          tahun: tahunController.text,
          warna: warnaController.text,
          transmisi: selectedTransmisi.value,
        );

        print('registerResponse: ${registerResponse.toJson()}');

        if (registerResponse != null && registerResponse.status == true) {
          Get.offAllNamed(Routes.SINGIN);
        } else {
          Get.snackbar('Error', 'Terjadi kesalahan saat registrasi',
              backgroundColor: Colors.redAccent,
              colorText: Colors.white);
        }
      } catch (e) {
        print('Error during registration: $e');
        Get.snackbar('Gagal Registrasi', 'Terjadi kesalahan saat registrasi',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar('Gagal Registrasi', 'Semua bidang harus diisi',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }
}