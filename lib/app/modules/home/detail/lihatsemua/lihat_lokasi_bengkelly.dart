import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/app_pages.dart';

List<Map<String, dynamic>> restAreaPlace = [
  {
    "id": "1",
    "name": "Rest Area KM 228A",
    'address': "KM 228A Tol Kanci - Pejagan",
    'logo': "assets/logo/228a.jpg",
    'description':
    'Rest Area 228A merupakan sebuah fasilitas istirahat yang terletak strategis di sepanjang jalan tol atau jalan raya, menyediakan berbagai fasilitas yang diperlukan untuk memenuhi kebutuhan pengemudi dan penumpang. Tujuannya sederhana: memberikan kesempatan bagi pengguna jalan untuk beristirahat, memulihkan energi, serta melanjutkan perjalanan dengan nyaman dan aman.',
    'sliderImages': [
      'assets/228a/s228a-1.jpg',
      'assets/228a/s228a-2.jpg',
      'assets/228a/s228a-3.jpg',
    ]
  },
  {
    "id": "2",
    "name": "Rest Area KM 319B",
    'logo': "assets/logo/319b.jpg",
    'address': "KM 319B Tol Pemalang - Jakarta",
    'description':
    'Rest Area KM 319B Pemalang-Batang adalah destinasi istirahat yang penting di jalan tol antara Pemalang dan Batang. Tempat ini memberikan fasilitas yang lengkap untuk para pengendara yang melakukan perjalanan jauh. Dengan tempat parkir yang luas untuk kendaraan pribadi dan bus, toilet yang bersih, dan area makan dan minum yang menyediakan berbagai macam makanan dan minuman.',
    'sliderImages': [
      'assets/319b/s319b-1.jpg',
      'assets/319b/s319b-2.jpg',
      'assets/319b/s319b-3.jpg',
    ],
  },
  {
    "id": "3",
    "name": "Rest Area KM 379A",
    'logo': "assets/logo/379a.jpg",
    'address': "KM 379A Tol Pemalang - Batang",
    'description':
    'Rest Area KM 379A adalah titik istirahat yang strategis di jalan tol, terletak di kilometer 379A. Didesain untuk memberikan kenyamanan bagi para pengguna jalan, fasilitas ini menyediakan berbagai layanan penting seperti tempat parkir yang luas untuk kendaraan pribadi dan bus, area istirahat dengan bangku dan meja yang nyaman, serta fasilitas toilet yang bersih.',
    'sliderImages': [
      'assets/379a/s379a-1.jpg',
      'assets/379a/s379a-2.jpg',
    ]
  },
  {
    "id": "4",
    "name": "Rest Area KM 389B",
    'logo': "assets/logo/389b.jpg",
    'address': "KM 389B Tol Pemalang - Batang",
    'description':
    'Rest Area KM 389B Batang-Semarang adalah sebuah fasilitas istirahat yang terletak di jalan tol yang menghubungkan Batang dan Semarang. Didesain untuk memenuhi kebutuhan para pengendara yang melakukan perjalanan jauh, rest area ini menyediakan beragam fasilitas yang nyaman dan memadai.',
    'sliderImages': [
      'assets/389b/s389b-1.jpg',
      'assets/389b/s389b-2.jpg',
    ]
  },
];

class SemuaLokasiBengkelly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
        title: Text(
          'Rest Area List',
          style: GoogleFonts.nunito(
            color: MyColors.appPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: restAreaPlace.length,
        itemBuilder: (context, index) {
          final restArea = restAreaPlace[index];
          return
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 475),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Image.asset(
                  restArea['logo'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  restArea['name'],
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  restArea['address'],
                  style: GoogleFonts.nunito(),
                ),
                onTap: () {
                  Get.toNamed(Routes.DETAILLOKASIBENGKELLY,
                      arguments:
                      {
                        'id': restArea['id'],
                        'description': restArea['description'],
                        'name': restArea['name'],
                        'sliderImages': restArea['sliderImages'],
                      }
                  );
                },
              ),
              ]))
          );
        },
      ),
    );
  }
}

