import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/data_endpoint/lokasi.dart';
import '../../../data/data_endpoint/jenisservice.dart';
import '../../../data/data_endpoint/customkendaraan.dart';
import '../../../data/endpoint.dart';
import '../../../routes/app_pages.dart';

class BookingController extends GetxController {
  var Keluhan = ''.obs;
  var selectedTransmisi = Rx<DataKendaraan?>(null);
  var selectedService = Rx<JenisServices?>(null);
  var selectedLocation = Rx<String?>(null);
  var selectedLocationID = Rx<Data?>(null);
  var selectedDate = Rx<DateTime?>(null);
  var selectedTime = Rx<TimeOfDay?>(null); // Tambahkan ini
  var tipeList = <DataKendaraan>[].obs;
  var serviceList = <JenisServices>[].obs;
  var isLoading = true.obs;

  bool isFormValid() {
    return selectedTransmisi.value != null &&
        selectedService.value != null &&
        selectedLocation.value != null &&
        selectedDate.value != null &&
        Keluhan.value.isNotEmpty;
  }

  void selectTransmisi(DataKendaraan value) {
    selectedTransmisi.value = value;
  }

  void selectService(JenisServices value) {
    selectedService.value = value;
  }

  void selectLocation(String location, Data id) {
    selectedLocation.value = location;
    selectedLocationID.value = id;
  }

  Future<void> BookingID() async {
    if (isFormValid()) {
      try {
        // Check if selectedDate and selectedTime are not null
        if (selectedDate.value == null || selectedTime.value == null) {
          Get.snackbar('Gagal Booking', 'Tanggal dan waktu harus dipilih',
              backgroundColor: Colors.redAccent, colorText: Colors.white);
          return;
        }

        final DateTime selectedDateTime = DateTime(
          selectedDate.value!.year,
          selectedDate.value!.month,
          selectedDate.value!.day,
          selectedTime.value!.hour,
          selectedTime.value!.minute,
        );

        // Check if all necessary values are not null before using them
        if (selectedLocation.value == null ||
            selectedService.value == null ||
            selectedTransmisi.value == null) {
          Get.snackbar('Gagal Booking', 'Semua bidang harus diisi',
              backgroundColor: Colors.redAccent, colorText: Colors.white);
          return;
        }

        // Print values before sending the request
        print('idcabang: ${selectedLocation.value!}');
        print('idjenissvc: ${selectedService.value!.id.toString()}');
        print('keluhan: ${Keluhan.value}');
        print('tglbooking: ${DateFormat('yyyy-MM-dd').format(selectedDateTime)}');
        print('jambooking: ${DateFormat('HH:mm').format(selectedDateTime)}');
        print('idkendaraan: ${selectedTransmisi.value!.id.toString()}');
        print('registerResponse: ${selectedLocation}');
        final registerResponse = await API.BookingID(
          idcabang: selectedLocation.value!,
          idjenissvc: selectedService.value!.id.toString(), // assuming id is a string
          keluhan: Keluhan.value,
          tglbooking: DateFormat('yyyy-MM-dd').format(selectedDateTime),
          jambooking: DateFormat('HH:mm').format(selectedDateTime),
          idkendaraan: selectedTransmisi.value!.id.toString(), // assuming id is a string
        );



        if (registerResponse != null && registerResponse.status == true) {
          Get.offAllNamed(Routes.SINGIN);
        } else {
          Get.snackbar('Error', 'Terjadi kesalahan saat Booking',
              backgroundColor: Colors.redAccent, colorText: Colors.white);
        }
      } catch (e) {
        print('Error during registration: $e');
        Get.snackbar('Gagal Booking', 'Terjadi kesalahan saat Booking',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } else {
      Get.snackbar('Gagal Booking', 'Semua bidang harus diisi',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }

  Future<void> fetchServiceList() async {
    try {
      isLoading.value = true;
      var jenisservice = await API.JenisServiceID();
      if (jenisservice != null) {
        serviceList.value = jenisservice.dataservice ?? [];
      }
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTipeList() async {
    try {
      isLoading.value = true;
      var customerKendaraan = await API.PilihKendaraan();
      if (customerKendaraan != null) {
        tipeList.value = customerKendaraan.datakendaraan ?? [];
        if (tipeList.isNotEmpty) {
          selectedTransmisi.value = tipeList.first;
        }
      }
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTipeList();
    fetchServiceList();
  }
}
