import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../componen/color.dart';
import '../../../routes/app_pages.dart';
import '../../booking/componen/list_kendataan.dart';
import '../../booking/controllers/booking_controller.dart';

class PilihKendaraan extends StatelessWidget {
  final BookingController controller = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: SizedBox(
                height: 50, // <-- Your height
                child: ElevatedButton(
                    onPressed: () async {
                      Get.toNamed(Routes.TAMBAHKENDARAAN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.appPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text(
                          'Tambah Kendaraan',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
        title: Obx(() => Text(
          'Pilih Kendaraan: ${controller.selectedTransmisi.value?.merks?.namaMerk ?? ''}',
          style: GoogleFonts.nunito(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),
        )),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListKendaraanWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
