import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../componen/color.dart';
import '../../../componen/custom_widget.dart';
import '../../../data/data_endpoint/bookingcustomer.dart';
import '../../../data/data_endpoint/kategorikendaraan.dart';
import '../../../data/data_endpoint/merekkendaraan.dart';
import '../../../data/data_endpoint/tipekendaraan.dart';
import '../../../data/endpoint.dart';
import '../../authorization/componen/common.dart';
import '../../authorization/componen/fade_animationtest.dart';
import '../../authorization/componen/login_page.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tipeList = ["AT", "MT"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ],
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Form(
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: CustomDropdown.search(
                              hintText: 'Transmisi Kendaraan',
                              items: tipeList,
                              onChanged: (value) {
                                controller.selectedTransmisi.value = value!;
                                print("Selected Tipe: ${controller.selectedTransmisi.value}");
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const FadeInAnimation(
                          delay: 1.8,
                          child: CustomTextFormField(
                            hinttext: 'Tahun',
                            obsecuretext: false,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const FadeInAnimation(
                          delay: 1.8,
                          child: CustomTextFormField(
                            hinttext: 'Tahun',
                            obsecuretext: false,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        FadeInAnimation(
                          delay: 1.8,
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: CustomDropdown.search(
                              hintText: 'Transmisi Kendaraan',
                              items: tipeList,
                              onChanged: (value) {
                                controller.selectedTransmisi.value = value!;
                                print("Selected Tipe: ${controller.selectedTransmisi.value}");
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const FadeInAnimation(
                          delay: 1.8,
                          child: CustomTextFormField(
                            hinttext: 'Tahun',
                            obsecuretext: false,
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
                        // FadeInAnimation(
                        //   delay: 2.9,
                        //   child: Text(
                        //     "Atau Daftar dengan",
                        //     style: Common().semiboldblack,
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                FadeInAnimation(
                  delay: 3.6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya Akun ?",
                          style: Common().hinttext,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(const LoginPage());
                            },
                            child: Text(
                              "Login Sekarang",
                              style: Common().mediumTheme,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}