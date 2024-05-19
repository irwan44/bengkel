
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/data_endpoint/jenisservice.dart';
import '../../../data/data_endpoint/lokasi.dart'as LokasiEndpoint;
import '../../../data/data_endpoint/customkendaraan.dart';
import '../../../data/endpoint.dart';

class BookingController extends GetxController {
  final Keluhan = TextEditingController();
  var selectedTransmisi = Rx<DataKendaraan?>(null);
  var selectedService = Rx<JenisServices?>(null);
  var selectedLocation = Rx<String?>(null);
  var selectedDate = Rx<DateTime?>(null);
  var tipeList = <DataKendaraan>[].obs;
  var serviceList = <JenisServices>[].obs;
  var isLoading = true.obs;

  void selectTransmisi(DataKendaraan value) {
    selectedTransmisi.value = value;
  }

  void selectService(JenisServices value) {
    selectedService.value = value;
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
