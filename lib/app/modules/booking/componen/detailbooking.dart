import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../authorization/componen/fade_animationtest.dart';
import '../controllers/booking_controller.dart';

class DetailBookingView extends StatefulWidget {
  @override
  DetailBookingViewState createState() => DetailBookingViewState();
}

class DetailBookingViewState extends State<DetailBookingView> {
  final controller = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: SizedBox(
                height: 50, // <-- Your height
                child: ElevatedButton(
                  onPressed: () => controller.BookingID(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4.0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        'Konfirmasi Sekarang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Detail Booking', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInAnimation(
                  delay: 1.8,
                  child: Text('Cek Kembali Data Booking Anda', style: TextStyle(fontWeight: FontWeight.bold, color: MyColors.appPrimaryColor, fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FadeInAnimation(
                          delay: 1.8,
                          child: Text('Detail Kendaraan', style: TextStyle(),),
                        ),
                        SizedBox(height: 10,),
                        FadeInAnimation(
                          delay: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: MyColors.bg,
                                border: Border.all(color: MyColors.bgformborder),
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Obx(() => InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                      Text('${controller.selectedTransmisi.value!.merks?.namaMerk}',style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text('${controller.selectedTransmisi.value!.noPolisi}'),
                                      Row(children: [
                                        Text('${controller.selectedTransmisi.value!.warna}'),
                                        Text(' - '),
                                        Text('Tahun ${controller.selectedTransmisi.value!.tahun}'),
                                      ],)
                                    ],),
                                  ],
                                ),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const FadeInAnimation(
                          delay: 1.8,
                          child: Text('Detail Lokasi, Tanggal dan Waktu', style: TextStyle(),),
                        ),
                        SizedBox(height: 10,),
                        FadeInAnimation(
                          delay: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: MyColors.bg,
                                border: Border.all(color: MyColors.bgformborder),
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () async {
                              },
                              child: Obx(() => InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.selectedDate.value == null
                                          ? 'Pilih Jadwal'
                                          : DateFormat('dd/MM/yyyy HH:mm').format(controller.selectedDate.value!),
                                      style: TextStyle(
                                        color: controller.selectedDate.value == null ? Colors.grey : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const FadeInAnimation(
                          delay: 1.8,
                          child: Text('Jenis Service', style: TextStyle(),),
                        ),
                        SizedBox(height: 10,),
                        FadeInAnimation(
                          delay: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: MyColors.bg,
                                border: Border.all(color: MyColors.bgformborder),
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Obx(() => InputDecorator(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.selectedService.value == null || controller.selectedService.value!.namaJenissvc == "Default Service"
                                          ? 'Pilih Jasa'
                                          : '${controller.selectedService.value!.namaJenissvc}',
                                      style: TextStyle(
                                        color: controller.selectedService.value == null || controller.selectedService.value!.namaJenissvc == "Default Service" ? Colors.grey : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const FadeInAnimation(
                          delay: 1.8,
                          child: Text('Keluhan', style: TextStyle(),),
                        ),
                        SizedBox(height: 10,),
                        FadeInAnimation(
                          delay: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              color: MyColors.bg,
                              border: Border.all(color: MyColors.bgformborder), // Change to your primary color
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              height: 200, // <-- TextField expands to this height.
                              child: TextFormField(
                                maxLines: null,
                                expands: true,
                                readOnly: true,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                controller: TextEditingController(text: controller.Keluhan.value),
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(18),
                                    border: InputBorder.none,
                                   fillColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                    hintText: 'Keluhan'
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}