import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../componen/color.dart';

class DetailLokasiBengkelly extends StatefulWidget {
  @override
  State<DetailLokasiBengkelly> createState() => _DetailLokasiBengkellyState();
}

class _DetailLokasiBengkellyState extends State<DetailLokasiBengkelly> {
  late final String description;
  late final String id;
  late final String nama;
  late List<String> sliderImagesList;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> arguments = Get.arguments;
    description = arguments['description'];
    id = arguments['id'];
    nama = arguments['name'];
    sliderImagesList = List<String>.from(arguments['sliderImages']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
        title: const Text('Rest Area'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: ArgumentsLokasi(
          description: description,
          nama: nama,
          sliderImages: sliderImagesList,
          id: id,
        ),
      ),
    );
  }
}

class ArgumentsLokasi extends StatefulWidget {
  final String description;
  final String id;
  final String nama;
  final List<String> sliderImages;

  const ArgumentsLokasi(
      {Key? key,
        required this.description,
        required this.nama,
        required this.sliderImages,
        required this.id})
      : super(key: key);

  @override
  State<ArgumentsLokasi> createState() => _ArgumentsLokasiState();
}

class _ArgumentsLokasiState extends State<ArgumentsLokasi> {
  int _currentIndex = 0;
  String? selectedTenantId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Slider(context),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.nama,
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(height: 10),
              Text(
                'Deskripsi',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                widget.id,
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(height: 10),
              ExpandableText(
                widget.description,
                expandText: 'Lihat Selengkapnya',
                collapseText: 'show less',
                maxLines: 5,
                linkColor: Colors.blue,
              ),
              SizedBox(height: 10),
              Text(
                'Fasilitas',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(height: 10),
              SvgPicture.asset(
                'assets/icons/icond.svg',
                width: 110,
              ),
              SizedBox(height: 10),
              Text(
                'Tenants',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(height: 10),
              _buildTenantList(context),
              if (selectedTenantId != null) ...[
                SizedBox(height: 20),
                Text(
                  'Menu',
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                _buildMenuList(context, selectedTenantId!),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _Slider(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.7,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.sliderImages.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: MyColors.slider,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.sliderImages.map((image) {
              int index = widget.sliderImages.indexOf(image);
              return Container(
                width: 19.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  color: _currentIndex == index
                      ? MyColors.appPrimaryColor
                      : MyColors.slider,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTenantList(BuildContext context) {
    List<Map<String, dynamic>> restAreaTenants = [
      {
        "id": "1",
        "restAreaId": "1", // Indicates the rest area ID for Empal Gentong H. Irwan
        "name": "Warung Makan Jamblang",
        'image': "assets/tenant_dummy/nasi_jamplang/nasi-jamblang-jeh.jpg",
        'address': "KM 228A Tol Surabaya - Jakarta",
        'description': 'Warung makan nasi jamplang adalah sebuah tempat makan yang menyajikan hidangan nasi dengan berbagai pilihan lauk pauk dan sayuran yang disajikan dalam satu hidangan utama. Jamplang sendiri merujuk pada tradisi penyajian nasi dengan menggunakan nampan yang terbuat dari anyaman bambu atau keranjang bambu. Di warung makan ini, pengunjung dapat memilih berbagai macam lauk pauk seperti ayam goreng, ayam bakar, tempe goreng, tahu goreng, sambal, dan berbagai jenis sayuran. Hidangan ini biasanya disajikan dalam porsi yang cukup besar dan cocok dinikmati bersama keluarga atau teman-teman. Warung makan nasi jamplang seringkali menjadi tempat makan favorit bagi mereka yang menginginkan hidangan tradisional Indonesia yang lezat dan mengenyangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Pepes Ayam",
            'image': "assets/tenant_dummy/nasi_jamplang/pepes-ayam.jpg",
            'deskripsi':
            'dari potongan daging ayam yang\ndibumbui dengan rempah\ntradisional seperti bawang\nmerah, bawang putih,\njahe, kunyit, dan daun jeruk',
            'harga': 10000
          },
          {
            "id": "2",
            "name": "Semur Telur",
            'image': "assets/tenant_dummy/nasi_jamplang/Semur-Telur.jpg",
            'deskripsi':
            'Terdiri dari bawang merah,\nbawang putih, kecap manis,\ngula merah, dan rempah-rempah\nlainnya.',
            'harga': 8000
          },
          {
            "id": "3",
            "name": "Terong Balado",
            'image': "assets/tenant_dummy/nasi_jamplang/terong-balado.jpg",
            'deskripsi': 'terbuat dari cabai, bawang merah,\nbawang putih, tomat, dan\nbumbu-bumbu lainnya yang\ndihaluskan dan dimasak\nhingga matang.',
            'harga': 8000
          },
        ]
      },
      {
        "id": "2",
        "restAreaId": "1", // Indicates the rest area ID for Empal Gentong H. Irwan
        "name": "Warung Makan Selonjoran",
        'image': "assets/tenant_dummy/warung_makan_selonjoran/warung-makan-selonjoran.jpeg",
        'address': "KM 228A Tol Surabaya - Jakarta",
        'description': 'Warung makan Selonjoran adalah sebuah tempat makan yang terletak di rest area 228A yang terkenal dengan hidangan-hidangan khas masakan nya. Biasanya, warung makan ini menawarkan beragam hidangan seperti sop iga, iga bakar, pecel ayam, soto ayam, dll.',
        'menu': [
          {
            "id": "1",
            "name": "Sop Iga",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/sop-iga.jpg",
            'deskripsi': 'berbagai rempah-rempah dan bahan\ntambahan seperti wortel,\nkentang, bawang merah,\nbawang putih, dan daun bawang',
            'harga': 17000
          },
          {
            "id": "2",
            "name": "iga Bakar",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/iga-bakar.jpg",
            'deskripsi':
            'campuran kecap manis, bawang putih,\nbawang merah, cabai, dan\nrempah-rempah lainnya untuk\nmemberikan cita rasa yang\nkaya dan meresap',
            'harga': 22000
          },
          {
            "id": "3",
            "name": "Pecel Ayam",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/pecel-ayam.jpg",
            'deskripsi': 'dengan berbagai rempah dan\nbumbu sebelum direbus\natau digoreng sehingga\nmemiliki cita rasa\nyang khas dan gurih',
            'harga': 25000
          },{
            "id": "4",
            "name": "Soto Ayam",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/soto-ayam.jpg",
            'deskripsi': 'dibuat dari kaldu ayam yang\ndihasilkan dari merebus daging\nayam bersama dengan bumbu\nrempah seperti bawang putih,\nbawang merah, jahe, ketumbar, dan serai',
            'harga': 20000
          },
        ]
      },
      {
        "id": "3",
        "restAreaId": "2", // Indicates the rest area ID for Pusat Oleh - oleh Yuin
        "name": "Empal Gentong H Irwan",
        'image': "assets/tenant_dummy/empal_gentong/empal-gentong-h-irwan.jpeg",
        'address': "KM 319B Tol Surabaya - Jakarta",
        'description': 'Warung makan nasi jamplang adalah sebuah tempat makan yang menyajikan hidangan nasi dengan berbagai pilihan lauk pauk dan sayuran yang disajikan dalam satu hidangan utama. Jamplang sendiri merujuk pada tradisi penyajian nasi dengan menggunakan nampan yang terbuat dari anyaman bambu atau keranjang bambu. Di warung makan ini, pengunjung dapat memilih berbagai macam lauk pauk seperti ayam goreng, ayam bakar, tempe goreng, tahu goreng, sambal, dan berbagai jenis sayuran. Hidangan ini biasanya disajikan dalam porsi yang cukup besar dan cocok dinikmati bersama keluarga atau teman-teman. Warung makan nasi jamplang seringkali menjadi tempat makan favorit bagi mereka yang menginginkan hidangan tradisional Indonesia yang lezat dan mengenyangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Empal Gentong",
            'image': "assets/tenant_dummy/empal_gentong/empal-gentong.jpg",
            'deskripsi': 'terbuat dari daging sapi, usus,\ndan babat. Empal gentong\nmirip dengan gulai dan dimasak\nmenggunakan kayu bakar\ndi dalam gentong tanah liat',
            'harga': 37000
          },
          {
            "id": "2",
            "name": "Sate Maranggi",
            'image': "assets/tenant_dummy/empal_gentong/sate-maranggi.jpg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 55000
          },
          {
            "id": "3",
            "name": "Sate Kambing Muda",
            'image': "assets/tenant_dummy/empal_gentong/sate-kambing-muda.jpg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 80000
          },
        ]
      },
      {
        "id": "4",
        "restAreaId": "2", // Indicates the rest area ID for Pusat Oleh - oleh Yuin
        "name": "Rosin Resto",
        'image': "assets/tenant_dummy/rosin_resto/rosin_resto.jpg",
        'address': "KM 319B Tol Surabaya - Jakarta",
        'description': 'Warung makan nasi jamplang adalah sebuah tempat makan yang menyajikan hidangan nasi dengan berbagai pilihan lauk pauk dan sayuran yang disajikan dalam satu hidangan utama. Jamplang sendiri merujuk pada tradisi penyajian nasi dengan menggunakan nampan yang terbuat dari anyaman bambu atau keranjang bambu. Di warung makan ini, pengunjung dapat memilih berbagai macam lauk pauk seperti ayam goreng, ayam bakar, tempe goreng, tahu goreng, sambal, dan berbagai jenis sayuran. Hidangan ini biasanya disajikan dalam porsi yang cukup besar dan cocok dinikmati bersama keluarga atau teman-teman. Warung makan nasi jamplang seringkali menjadi tempat makan favorit bagi mereka yang menginginkan hidangan tradisional Indonesia yang lezat dan mengenyangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Ayam Bakar",
            'image': "assets/tenant_dummy/rosin_resto/ayam_bakar.jpg",
            'deskripsi': 'terbuat dari daging sapi, usus,\ndan babat. Empal gentong\nmirip dengan gulai dan dimasak\nmenggunakan kayu bakar\ndi dalam gentong tanah liat',
            'harga': 37000
          },
          {
            "id": "2",
            "name": "Mie Ayam",
            'image': "assets/tenant_dummy/rosin_resto/mie-ayam.jpeg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 55000
          },
          {
            "id": "3",
            "name": "Nasi Goreng",
            'image': "assets/tenant_dummy/rosin_resto/nasi-goreng.jpg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 80000
          },
        ]
      },
      {
        "id": "5",
        "restAreaId": "3", // Indicates the rest area ID for Nasi Jamblang KM 228A
        "name": "Bu Monggo",
        'image': "assets/tenant_dummy/bu_monggo/bu-monggo.jpg",
        'address': "KM 228A Tol Pemalang - Batang",
        'description': 'Warung makan Bu Monggo adalah warung makan kecil yang terletak di rest area KM 379A. Warung ini dikenal karena menyajikan hidangan khas tradisional Indonesia dengan cita rasa yang autentik dan harga yang terjangkau. Menu makanan yang ditawarkan di Bu Monggo mencakup berbagai hidangan khas seperti nasi goreng, mie goreng, ayam goreng, soto ayam, dan gado-gado. Selain itu, mereka juga menyajikan berbagai lauk-pauk seperti tempe goreng, tahu goreng, dan telur dadar. Harga menu di Bu Monggo berkisar antara Rp 10.000 hingga Rp 25.000 per porsi, membuatnya menjadi pilihan yang populer bagi para wisatawan dan penduduk lokal yang mencari makanan lezat dengan harga yang ramah di kantong.',
        'menu': [
          {
            "id": "1",
            "name": "Soto Ayam Kampung",
            'image': "assets/tenant_dummy/bu_monggo/Soto-Ayam-kampung.jpg",
            'deskripsi':
            'Dari rebusan daging ayam bersama\nrempah-rempah.',
            'harga': 35000

          },
          {
            "id": "2",
            "name": "Nasi Rames Bu Monggo",
            'image': "assets/tenant_dummy/bu_monggo/nasi-rames.jpg",
            'deskripsi':
            'nasi putih yang disajikan dengan\npilihan lauk seperti ayam goreng,\ntelur dadar, tempe goreng\ntahu goreng, ikan bakar.',
            'harga': 30000
          },
          {
            "id": "3",
            "name": "Ayam Goreng Kampung",
            'image': "assets/tenant_dummy/bu_monggo/ayam-kampung-goreng.jpg",
            'deskripsi': 'memiliki cita rasa yang khas\ndengan rempah-rempah tradisional yang \nmemberikan rasa gurih dan lezat.',
            'harga': 28000
          },
          {
            "id": "4",
            "name": "Wedang Uwuh",
            'image': "assets/tenant_dummy/bu_monggo/wedang-uwuh.jpg",
            'deskripsi': 'terbuat dari campuran rempah-rempah\ntradisional seperti jahe, kayu manis, \ncengkeh, dan daun pandan yang direbus \nbersama dengan gula merah atau madu \nuntuk memberikan rasa manis alami',
            'harga': 15000
          },
        ]
      },
      {
        "id": "6",
        "restAreaId": "3", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "Chicken RiceQu",
        'image': "assets/tenant_dummy/warung.jpg",
        'address': "KM 379A Tol Pemalang - Batang",
        'description': 'Warung makan RiceQu 3T adalah sebuah tempat makan yang menawarkan hidangan nasi campur dengan konsep tiga T, yaitu Tahan, Tepat, dan Terjangkau. Biasanya, warung makan ini menyajikan beragam pilihan lauk pauk dan sambal dengan harga yang terjangkau. Hidangan yang ditawarkan mungkin bervariasi, tetapi umumnya terdiri dari Rawon, Nasi Uduk, Ayam Kampung, Nasi Goreng Spesial yang disajikan dengan pilihan lauk seperti ayam, ikan, daging sapi, tempe, tahu, telur, dan sayuran. Warung makan RiceQu 3T biasanya menjadi pilihan favorit untuk makan siang atau makan malam sehari-hari bagi banyak orang karena kualitas makanannya yang baik, harga yang terjangkau, dan suasana yang santai.',
        'menu': [
          {
            "id": "1",
            "name": "Nasi Rawon",
            'image': "assets/tenant_dummy/chicken_ricequ/chicken-ricequ.jpg",
            'deskripsi':
            'sebuah hidangan sup daging sapi yang\nmemiliki warna hitam pekat karena\nmenggunakan bumbu kluwek',
            'harga': 34000
          },
          {
            "id": "2",
            "name": "Nasi Uduk",
            'image': "assets/tenant_dummy/chicken_ricequ/nasi-uduk-ayam-tahu-tempe.jpg",
            'deskripsi':
            'hidangan nasi yang dimasak dengan\nsantan dan rempah-rempah seperti\nserai, daun salam, dan lengkuas,\n memberikan aroma dan cita\nrasa yang khas',
            'harga': 30000
          },
          {
            "id": "3",
            "name": "Ayam Kampung",
            'image': "assets/tenant_dummy/bu_monggo/ayam-kampung-goreng.jpg",
            'deskripsi': 'Setiap gigitannya membangkitkan\nkenikmatan rasa yang menggugah selera',
            'harga': 28000
          },
          {
            "id": "4",
            "name": "Nasi Goreng Spesial Daging",
            'image': "assets/tenant_dummy/chicken_ricequ/nasi-goreng-spesial-daging.jpg",
            'deskripsi': 'Dengan tambahan topping yang meliputi\npotongan daging ayam, udang,\ntelur dadar, irisan sayuran segar ',
            'harga': 27000
          },
        ]
      },
      {
        "id": "7",
        "restAreaId": "3", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "RM Simpang Raya",
        'image': "assets/tenant_dummy/simpang_raya/simpang-raya.jpg",
        'address': "KM 379A Tol Pemalang - Batang",
        'description': 'Rumah makan Simpang Raya adalah sebuah restoran yang terletak di dekat rest area 379A . Dengan desain yang sederhana namun nyaman, rumah makan ini menawarkan berbagai hidangan khas lokal dengan cita rasa autentik dan harga yang terjangkau. Pengunjung dapat menikmati berbagai masakan tradisional dan modern yang disajikan dengan porsi yang cukup besar. Suasana ramah dan pelayanan yang baik menjadikan rumah makan Simpang Raya menjadi tempat yang populer bagi penduduk setempat maupun wisatawan yang ingin menikmati kuliner lokal yang lezat.',
        'menu': [
          {
            "id": "1",
            "name": "Ayam Pop",
            'image': "assets/tenant_dummy/simpang_raya/ayam-pop.jpg",
            'deskripsi': 'Disajikan dengan bumbu rempah yang\nkhas, seperti bawang putih, merica,\ngaram, dan bumbu-bumbu lainnya\nyang memberikan cita\nrasa gurih dan aromatik yang khas',
            'harga': 17000
          },
          {
            "id": "2",
            "name": "Rendang",
            'image': "assets/tenant_dummy/simpang_raya/rendang.jpg",
            'deskripsi': 'Terbuat dari potongan daging sapi\npilihan yang dimasak dengan sempurna\ndalam bumbu rempah-rempah yang kaya',
            'harga': 18000
          },
          {
            "id": "3",
            "name": "Sayur Daun Singkong",
            'image': "assets/tenant_dummy/simpang_raya/sayur-daun-singkong.jpg",
            'deskripsi': 'Daun singkong segar yang dimasak\ndengan santan dan bumbu\nrempah yang khas',
            'harga': 5000
          },
        ]
      },
      {
        "id": "8",
        "restAreaId": "4", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "RM Simpang Raya",
        'image': "assets/tenant_dummy/simpang_raya/simpang-raya.jpg",
        'address': "KM 389B Tol Pemalang - Batang",
        'description': 'Rumah makan Simpang Raya adalah sebuah restoran yang terletak di dekat rest area 379A . Dengan desain yang sederhana namun nyaman, rumah makan ini menawarkan berbagai hidangan khas lokal dengan cita rasa autentik dan harga yang terjangkau. Pengunjung dapat menikmati berbagai masakan tradisional dan modern yang disajikan dengan porsi yang cukup besar. Suasana ramah dan pelayanan yang baik menjadikan rumah makan Simpang Raya menjadi tempat yang populer bagi penduduk setempat maupun wisatawan yang ingin menikmati kuliner lokal yang lezat.',
        'menu': [
          {
            "id": "1",
            "name": "Ayam Pop",
            'image': "assets/tenant_dummy/simpang_raya/ayam-pop.jpg",
            'deskripsi': 'Disajikan dengan bumbu rempah yang\nkhas, seperti bawang putih, merica,\ngaram, dan bumbu-bumbu lainnya\nyang memberikan cita\nrasa gurih dan aromatik yang khas',
            'harga': 17000
          },
          {
            "id": "2",
            "name": "Rendang",
            'image': "assets/tenant_dummy/simpang_raya/rendang.jpg",
            'deskripsi': 'Terbuat dari potongan daging sapi\npilihan yang dimasak dengan sempurna\ndalam bumbu rempah-rempah yang kaya',
            'harga': 18000
          },
          {
            "id": "3",
            "name": "Sayur Daun Singkong",
            'image': "assets/tenant_dummy/simpang_raya/sayur-daun-singkong.jpg",
            'deskripsi': 'Daun singkong segar yang dimasak\ndengan santan dan bumbu\nrempah yang khas',
            'harga': 5000
          },
        ]
      },
      {
        "id": "9",
        "restAreaId": "4", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "Dapur Nafara",
        'image': "assets/tenant_dummy/dapur_nafara/dapur_nafara.jpg",
        'address': "KM 389B Tol Pemalang - Batang",
        'description': 'menjadi tempat favorit bagi pecinta kuliner untuk menikmati hidangan lezat dalam suasana yang menyenangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Iga Bakar Madu",
            'image': "assets/tenant_dummy/dapur_nafara/iga-bakar-madu.jpg",
            'deskripsi': 'disajikan dengan pelengkap\nseperti nasi putih, lalapan\nsegar,dan saus atau sambal\nuntuk menambahkan cita\nrasa yang beragam',
            'harga': 50000
          },
          {
            "id": "2",
            "name": "Ayam Goreng",
            'image': "assets/tenant_dummy/dapur_nafara/ayam_goreng.jpg",
            'deskripsi': 'hidangan yang sangat disukai\ndan sering ditemui di warung\nmakan, restoran, dan acara-acara\nmakan bersama di Indonesia',
            'harga': 25000
          },
          {
            "id": "3",
            "name": "Rawon",
            'image': "assets/tenant_dummy/dapur_nafara/rawon.jpg",
            'deskripsi': 'disajikan dengan nasi putih\ndan dilengkapi dengan telur\nasin, tauge, daun bawang,\nserta kerupuk sebagai pelengkapnya',
            'harga': 30000
          },
        ]
      },
      {
        "id": "10",
        "restAreaId": "4", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "Raja Sate H.Subali",
        'image': "assets/tenant_dummy/raja_sate/raja-sate-h-subali.jpg",
        'address': "KM 389B Tol Pemalang - Batang",
        'description': 'Raja Sate H. Subali adalah warung atau restoran yang dikenal karena menyajikan sate yang lezat dan berkualitas tinggi. Sate, hidangan yang terdiri dari potongan daging yang ditusuk dan dipanggang, adalah spesialisasi dari tempat ini. Warung atau restoran ini mungkin menawarkan berbagai macam sate, seperti sate ayam, sate kambing, sate sapi, atau variasi lainnya, dengan pilihan bumbu dan saus yang beragam sesuai selera.',
        'menu': [
          {
            "id": "1",
            "name": "Sate Ayam",
            'image': "assets/tenant_dummy/raja_sate/sate-ayam.jpg",
            'deskripsi': 'dilengkapi dengan irisan\nbawang merah, timun, dan\nlontong atau nasi putih\nsebagai pelengkapnya',
            'harga': 30000
          },
          {
            "id": "2",
            "name": "Sate Kambing",
            'image': "assets/tenant_dummy/raja_sate/sate-kambing.jpg",
            'deskripsi': 'direndam dalam campuran bumbu\nyang kaya rasa sebelum dipanggang,\nmemberikan cita rasa yang gurih\ndan beraroma pada setiap gigitannya.',
            'harga': 38000
          },
          {
            "id": "3",
            "name": "Nasi Sate Sapi",
            'image': "assets/tenant_dummy/raja_sate/sate-sapi.jpg",
            'deskripsi': 'disajikan dengan saus kacang\natau saus kecap, serta dilengkapi\ndengan irisan bawang merah, timun,\ndan lontong atau nasi putih\nsebagai pelengkapnya',
            'harga': 38000
          },
        ]
      }
    ];

    final List<Map<String, dynamic>> filteredTenants = restAreaTenants
        .where((tenant) => tenant['restAreaId'] == widget.id)
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredTenants.length,
      itemBuilder: (context, index) {
        final tenant = filteredTenants[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTenantId = tenant['id'];
            });
          },
          child: Card(
            child: ListTile(
              leading: Image.asset(
                tenant['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                tenant['name'],
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                tenant['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.nunito(fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuList(BuildContext context, String tenantId) {
    List<Map<String, dynamic>> restAreaTenants = [
      {
        "id": "1",
        "restAreaId": "1", // Indicates the rest area ID for Empal Gentong H. Irwan
        "name": "Warung Makan Jamblang",
        'image': "assets/tenant_dummy/nasi_jamplang/nasi-jamblang-jeh.jpg",
        'address': "KM 228A Tol Surabaya - Jakarta",
        'description': 'Warung makan nasi jamplang adalah sebuah tempat makan yang menyajikan hidangan nasi dengan berbagai pilihan lauk pauk dan sayuran yang disajikan dalam satu hidangan utama. Jamplang sendiri merujuk pada tradisi penyajian nasi dengan menggunakan nampan yang terbuat dari anyaman bambu atau keranjang bambu. Di warung makan ini, pengunjung dapat memilih berbagai macam lauk pauk seperti ayam goreng, ayam bakar, tempe goreng, tahu goreng, sambal, dan berbagai jenis sayuran. Hidangan ini biasanya disajikan dalam porsi yang cukup besar dan cocok dinikmati bersama keluarga atau teman-teman. Warung makan nasi jamplang seringkali menjadi tempat makan favorit bagi mereka yang menginginkan hidangan tradisional Indonesia yang lezat dan mengenyangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Pepes Ayam",
            'image': "assets/tenant_dummy/nasi_jamplang/pepes-ayam.jpg",
            'deskripsi':
            'dari potongan daging ayam yang\ndibumbui dengan rempah\ntradisional seperti bawang\nmerah, bawang putih,\njahe, kunyit, dan daun jeruk',
            'harga': 10000
          },
          {
            "id": "2",
            "name": "Semur Telur",
            'image': "assets/tenant_dummy/nasi_jamplang/Semur-Telur.jpg",
            'deskripsi':
            'Terdiri dari bawang merah,\nbawang putih, kecap manis,\ngula merah, dan rempah-rempah\nlainnya.',
            'harga': 8000
          },
          {
            "id": "3",
            "name": "Terong Balado",
            'image': "assets/tenant_dummy/nasi_jamplang/terong-balado.jpg",
            'deskripsi': 'terbuat dari cabai, bawang merah,\nbawang putih, tomat, dan\nbumbu-bumbu lainnya yang\ndihaluskan dan dimasak\nhingga matang.',
            'harga': 8000
          },
        ]
      },
      {
        "id": "2",
        "restAreaId": "1", // Indicates the rest area ID for Empal Gentong H. Irwan
        "name": "Warung Makan Selonjoran",
        'image': "assets/tenant_dummy/warung_makan_selonjoran/warung-makan-selonjoran.jpeg",
        'address': "KM 228A Tol Surabaya - Jakarta",
        'description': 'Warung makan Selonjoran adalah sebuah tempat makan yang terletak di rest area 228A yang terkenal dengan hidangan-hidangan khas masakan nya. Biasanya, warung makan ini menawarkan beragam hidangan seperti sop iga, iga bakar, pecel ayam, soto ayam, dll.',
        'menu': [
          {
            "id": "1",
            "name": "Sop Iga",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/sop-iga.jpg",
            'deskripsi': 'berbagai rempah-rempah dan bahan\ntambahan seperti wortel,\nkentang, bawang merah,\nbawang putih, dan daun bawang',
            'harga': 17000
          },
          {
            "id": "2",
            "name": "iga Bakar",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/iga-bakar.jpg",
            'deskripsi':
            'campuran kecap manis, bawang putih,\nbawang merah, cabai, dan\nrempah-rempah lainnya untuk\nmemberikan cita rasa yang\nkaya dan meresap',
            'harga': 22000
          },
          {
            "id": "3",
            "name": "Pecel Ayam",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/pecel-ayam.jpg",
            'deskripsi': 'dengan berbagai rempah dan\nbumbu sebelum direbus\natau digoreng sehingga\nmemiliki cita rasa\nyang khas dan gurih',
            'harga': 25000
          },{
            "id": "4",
            "name": "Soto Ayam",
            'image': "assets/tenant_dummy/warung_makan_selonjoran/soto-ayam.jpg",
            'deskripsi': 'dibuat dari kaldu ayam yang\ndihasilkan dari merebus daging\nayam bersama dengan bumbu\nrempah seperti bawang putih,\nbawang merah, jahe, ketumbar, dan serai',
            'harga': 20000
          },
        ]
      },
      {
        "id": "3",
        "restAreaId": "2", // Indicates the rest area ID for Pusat Oleh - oleh Yuin
        "name": "Empal Gentong H Irwan",
        'image': "assets/tenant_dummy/empal_gentong/empal-gentong-h-irwan.jpeg",
        'address': "KM 319B Tol Surabaya - Jakarta",
        'description': 'Warung makan nasi jamplang adalah sebuah tempat makan yang menyajikan hidangan nasi dengan berbagai pilihan lauk pauk dan sayuran yang disajikan dalam satu hidangan utama. Jamplang sendiri merujuk pada tradisi penyajian nasi dengan menggunakan nampan yang terbuat dari anyaman bambu atau keranjang bambu. Di warung makan ini, pengunjung dapat memilih berbagai macam lauk pauk seperti ayam goreng, ayam bakar, tempe goreng, tahu goreng, sambal, dan berbagai jenis sayuran. Hidangan ini biasanya disajikan dalam porsi yang cukup besar dan cocok dinikmati bersama keluarga atau teman-teman. Warung makan nasi jamplang seringkali menjadi tempat makan favorit bagi mereka yang menginginkan hidangan tradisional Indonesia yang lezat dan mengenyangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Empal Gentong",
            'image': "assets/tenant_dummy/empal_gentong/empal-gentong.jpg",
            'deskripsi': 'terbuat dari daging sapi, usus,\ndan babat. Empal gentong\nmirip dengan gulai dan dimasak\nmenggunakan kayu bakar\ndi dalam gentong tanah liat',
            'harga': 37000
          },
          {
            "id": "2",
            "name": "Sate Maranggi",
            'image': "assets/tenant_dummy/empal_gentong/sate-maranggi.jpg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 55000
          },
          {
            "id": "3",
            "name": "Sate Kambing Muda",
            'image': "assets/tenant_dummy/empal_gentong/sate-kambing-muda.jpg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 80000
          },
        ]
      },
      {
        "id": "4",
        "restAreaId": "2", // Indicates the rest area ID for Pusat Oleh - oleh Yuin
        "name": "Rosin Resto",
        'image': "assets/tenant_dummy/rosin_resto/rosin_resto.jpg",
        'address': "KM 319B Tol Surabaya - Jakarta",
        'description': 'Warung makan nasi jamplang adalah sebuah tempat makan yang menyajikan hidangan nasi dengan berbagai pilihan lauk pauk dan sayuran yang disajikan dalam satu hidangan utama. Jamplang sendiri merujuk pada tradisi penyajian nasi dengan menggunakan nampan yang terbuat dari anyaman bambu atau keranjang bambu. Di warung makan ini, pengunjung dapat memilih berbagai macam lauk pauk seperti ayam goreng, ayam bakar, tempe goreng, tahu goreng, sambal, dan berbagai jenis sayuran. Hidangan ini biasanya disajikan dalam porsi yang cukup besar dan cocok dinikmati bersama keluarga atau teman-teman. Warung makan nasi jamplang seringkali menjadi tempat makan favorit bagi mereka yang menginginkan hidangan tradisional Indonesia yang lezat dan mengenyangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Ayam Bakar",
            'image': "assets/tenant_dummy/rosin_resto/ayam_bakar.jpg",
            'deskripsi': 'terbuat dari daging sapi, usus,\ndan babat. Empal gentong\nmirip dengan gulai dan dimasak\nmenggunakan kayu bakar\ndi dalam gentong tanah liat',
            'harga': 37000
          },
          {
            "id": "2",
            "name": "Mie Ayam",
            'image': "assets/tenant_dummy/rosin_resto/mie-ayam.jpeg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 55000
          },
          {
            "id": "3",
            "name": "Nasi Goreng",
            'image': "assets/tenant_dummy/rosin_resto/nasi-goreng.jpg",
            'deskripsi': 'terbuat dari potongan daging\napi atau domba yang ditusuk\ndan diberi bumbu, lalu dipanggang\ndi atas bara api.',
            'harga': 80000
          },
        ]
      },
      {
        "id": "5",
        "restAreaId": "3", // Indicates the rest area ID for Nasi Jamblang KM 228A
        "name": "Bu Monggo",
        'image': "assets/tenant_dummy/bu_monggo/bu-monggo.jpg",
        'address': "KM 228A Tol Pemalang - Batang",
        'description': 'Warung makan Bu Monggo adalah warung makan kecil yang terletak di rest area KM 379A. Warung ini dikenal karena menyajikan hidangan khas tradisional Indonesia dengan cita rasa yang autentik dan harga yang terjangkau. Menu makanan yang ditawarkan di Bu Monggo mencakup berbagai hidangan khas seperti nasi goreng, mie goreng, ayam goreng, soto ayam, dan gado-gado. Selain itu, mereka juga menyajikan berbagai lauk-pauk seperti tempe goreng, tahu goreng, dan telur dadar. Harga menu di Bu Monggo berkisar antara Rp 10.000 hingga Rp 25.000 per porsi, membuatnya menjadi pilihan yang populer bagi para wisatawan dan penduduk lokal yang mencari makanan lezat dengan harga yang ramah di kantong.',
        'menu': [
          {
            "id": "1",
            "name": "Soto Ayam Kampung",
            'image': "assets/tenant_dummy/bu_monggo/Soto-Ayam-kampung.jpg",
            'deskripsi':
            'Dari rebusan daging ayam bersama\nrempah-rempah.',
            'harga': 35000

          },
          {
            "id": "2",
            "name": "Nasi Rames Bu Monggo",
            'image': "assets/tenant_dummy/bu_monggo/nasi-rames.jpg",
            'deskripsi':
            'nasi putih yang disajikan dengan\npilihan lauk seperti ayam goreng,\ntelur dadar, tempe goreng\ntahu goreng, ikan bakar.',
            'harga': 30000
          },
          {
            "id": "3",
            "name": "Ayam Goreng Kampung",
            'image': "assets/tenant_dummy/bu_monggo/ayam-kampung-goreng.jpg",
            'deskripsi': 'memiliki cita rasa yang khas\ndengan rempah-rempah tradisional yang \nmemberikan rasa gurih dan lezat.',
            'harga': 28000
          },
          {
            "id": "4",
            "name": "Wedang Uwuh",
            'image': "assets/tenant_dummy/bu_monggo/wedang-uwuh.jpg",
            'deskripsi': 'terbuat dari campuran rempah-rempah\ntradisional seperti jahe, kayu manis, \ncengkeh, dan daun pandan yang direbus \nbersama dengan gula merah atau madu \nuntuk memberikan rasa manis alami',
            'harga': 15000
          },
        ]
      },
      {
        "id": "6",
        "restAreaId": "3", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "Chicken RiceQu",
        'image': "assets/tenant_dummy/warung.jpg",
        'address': "KM 379A Tol Pemalang - Batang",
        'description': 'Warung makan RiceQu 3T adalah sebuah tempat makan yang menawarkan hidangan nasi campur dengan konsep tiga T, yaitu Tahan, Tepat, dan Terjangkau. Biasanya, warung makan ini menyajikan beragam pilihan lauk pauk dan sambal dengan harga yang terjangkau. Hidangan yang ditawarkan mungkin bervariasi, tetapi umumnya terdiri dari Rawon, Nasi Uduk, Ayam Kampung, Nasi Goreng Spesial yang disajikan dengan pilihan lauk seperti ayam, ikan, daging sapi, tempe, tahu, telur, dan sayuran. Warung makan RiceQu 3T biasanya menjadi pilihan favorit untuk makan siang atau makan malam sehari-hari bagi banyak orang karena kualitas makanannya yang baik, harga yang terjangkau, dan suasana yang santai.',
        'menu': [
          {
            "id": "1",
            "name": "Nasi Rawon",
            'image': "assets/tenant_dummy/chicken_ricequ/chicken-ricequ.jpg",
            'deskripsi':
            'sebuah hidangan sup daging sapi yang\nmemiliki warna hitam pekat karena\nmenggunakan bumbu kluwek',
            'harga': 34000
          },
          {
            "id": "2",
            "name": "Nasi Uduk",
            'image': "assets/tenant_dummy/chicken_ricequ/nasi-uduk-ayam-tahu-tempe.jpg",
            'deskripsi':
            'hidangan nasi yang dimasak dengan\nsantan dan rempah-rempah seperti\nserai, daun salam, dan lengkuas,\n memberikan aroma dan cita\nrasa yang khas',
            'harga': 30000
          },
          {
            "id": "3",
            "name": "Ayam Kampung",
            'image': "assets/tenant_dummy/bu_monggo/ayam-kampung-goreng.jpg",
            'deskripsi': 'Setiap gigitannya membangkitkan\nkenikmatan rasa yang menggugah selera',
            'harga': 28000
          },
          {
            "id": "4",
            "name": "Nasi Goreng Spesial Daging",
            'image': "assets/tenant_dummy/chicken_ricequ/nasi-goreng-spesial-daging.jpg",
            'deskripsi': 'Dengan tambahan topping yang meliputi\npotongan daging ayam, udang,\ntelur dadar, irisan sayuran segar ',
            'harga': 27000
          },
        ]
      },
      {
        "id": "7",
        "restAreaId": "3", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "RM Simpang Raya",
        'image': "assets/tenant_dummy/simpang_raya/simpang-raya.jpg",
        'address': "KM 379A Tol Pemalang - Batang",
        'description': 'Rumah makan Simpang Raya adalah sebuah restoran yang terletak di dekat rest area 379A . Dengan desain yang sederhana namun nyaman, rumah makan ini menawarkan berbagai hidangan khas lokal dengan cita rasa autentik dan harga yang terjangkau. Pengunjung dapat menikmati berbagai masakan tradisional dan modern yang disajikan dengan porsi yang cukup besar. Suasana ramah dan pelayanan yang baik menjadikan rumah makan Simpang Raya menjadi tempat yang populer bagi penduduk setempat maupun wisatawan yang ingin menikmati kuliner lokal yang lezat.',
        'menu': [
          {
            "id": "1",
            "name": "Ayam Pop",
            'image': "assets/tenant_dummy/simpang_raya/ayam-pop.jpg",
            'deskripsi': 'Disajikan dengan bumbu rempah yang\nkhas, seperti bawang putih, merica,\ngaram, dan bumbu-bumbu lainnya\nyang memberikan cita\nrasa gurih dan aromatik yang khas',
            'harga': 17000
          },
          {
            "id": "2",
            "name": "Rendang",
            'image': "assets/tenant_dummy/simpang_raya/rendang.jpg",
            'deskripsi': 'Terbuat dari potongan daging sapi\npilihan yang dimasak dengan sempurna\ndalam bumbu rempah-rempah yang kaya',
            'harga': 18000
          },
          {
            "id": "3",
            "name": "Sayur Daun Singkong",
            'image': "assets/tenant_dummy/simpang_raya/sayur-daun-singkong.jpg",
            'deskripsi': 'Daun singkong segar yang dimasak\ndengan santan dan bumbu\nrempah yang khas',
            'harga': 5000
          },
        ]
      },
      {
        "id": "8",
        "restAreaId": "4", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "RM Simpang Raya",
        'image': "assets/tenant_dummy/simpang_raya/simpang-raya.jpg",
        'address': "KM 389B Tol Pemalang - Batang",
        'description': 'Rumah makan Simpang Raya adalah sebuah restoran yang terletak di dekat rest area 379A . Dengan desain yang sederhana namun nyaman, rumah makan ini menawarkan berbagai hidangan khas lokal dengan cita rasa autentik dan harga yang terjangkau. Pengunjung dapat menikmati berbagai masakan tradisional dan modern yang disajikan dengan porsi yang cukup besar. Suasana ramah dan pelayanan yang baik menjadikan rumah makan Simpang Raya menjadi tempat yang populer bagi penduduk setempat maupun wisatawan yang ingin menikmati kuliner lokal yang lezat.',
        'menu': [
          {
            "id": "1",
            "name": "Ayam Pop",
            'image': "assets/tenant_dummy/simpang_raya/ayam-pop.jpg",
            'deskripsi': 'Disajikan dengan bumbu rempah yang\nkhas, seperti bawang putih, merica,\ngaram, dan bumbu-bumbu lainnya\nyang memberikan cita\nrasa gurih dan aromatik yang khas',
            'harga': 17000
          },
          {
            "id": "2",
            "name": "Rendang",
            'image': "assets/tenant_dummy/simpang_raya/rendang.jpg",
            'deskripsi': 'Terbuat dari potongan daging sapi\npilihan yang dimasak dengan sempurna\ndalam bumbu rempah-rempah yang kaya',
            'harga': 18000
          },
          {
            "id": "3",
            "name": "Sayur Daun Singkong",
            'image': "assets/tenant_dummy/simpang_raya/sayur-daun-singkong.jpg",
            'deskripsi': 'Daun singkong segar yang dimasak\ndengan santan dan bumbu\nrempah yang khas',
            'harga': 5000
          },
        ]
      },
      {
        "id": "9",
        "restAreaId": "4", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "Dapur Nafara",
        'image': "assets/tenant_dummy/dapur_nafara/dapur_nafara.jpg",
        'address': "KM 389B Tol Pemalang - Batang",
        'description': 'menjadi tempat favorit bagi pecinta kuliner untuk menikmati hidangan lezat dalam suasana yang menyenangkan.',
        'menu': [
          {
            "id": "1",
            "name": "Iga Bakar Madu",
            'image': "assets/tenant_dummy/dapur_nafara/iga-bakar-madu.jpg",
            'deskripsi': 'disajikan dengan pelengkap\nseperti nasi putih, lalapan\nsegar,dan saus atau sambal\nuntuk menambahkan cita\nrasa yang beragam',
            'harga': 50000
          },
          {
            "id": "2",
            "name": "Ayam Goreng",
            'image': "assets/tenant_dummy/dapur_nafara/ayam_goreng.jpg",
            'deskripsi': 'hidangan yang sangat disukai\ndan sering ditemui di warung\nmakan, restoran, dan acara-acara\nmakan bersama di Indonesia',
            'harga': 25000
          },
          {
            "id": "3",
            "name": "Rawon",
            'image': "assets/tenant_dummy/dapur_nafara/rawon.jpg",
            'deskripsi': 'disajikan dengan nasi putih\ndan dilengkapi dengan telur\nasin, tauge, daun bawang,\nserta kerupuk sebagai pelengkapnya',
            'harga': 30000
          },
        ]
      },
      {
        "id": "10",
        "restAreaId": "4", // Indicates the rest area ID for Warung Jawa Timur Cak One
        "name": "Raja Sate H.Subali",
        'image': "assets/tenant_dummy/raja_sate/raja-sate-h-subali.jpg",
        'address': "KM 389B Tol Pemalang - Batang",
        'description': 'Raja Sate H. Subali adalah warung atau restoran yang dikenal karena menyajikan sate yang lezat dan berkualitas tinggi. Sate, hidangan yang terdiri dari potongan daging yang ditusuk dan dipanggang, adalah spesialisasi dari tempat ini. Warung atau restoran ini mungkin menawarkan berbagai macam sate, seperti sate ayam, sate kambing, sate sapi, atau variasi lainnya, dengan pilihan bumbu dan saus yang beragam sesuai selera.',
        'menu': [
          {
            "id": "1",
            "name": "Sate Ayam",
            'image': "assets/tenant_dummy/raja_sate/sate-ayam.jpg",
            'deskripsi': 'dilengkapi dengan irisan\nbawang merah, timun, dan\nlontong atau nasi putih\nsebagai pelengkapnya',
            'harga': 30000
          },
          {
            "id": "2",
            "name": "Sate Kambing",
            'image': "assets/tenant_dummy/raja_sate/sate-kambing.jpg",
            'deskripsi': 'direndam dalam campuran bumbu\nyang kaya rasa sebelum dipanggang,\nmemberikan cita rasa yang gurih\ndan beraroma pada setiap gigitannya.',
            'harga': 38000
          },
          {
            "id": "3",
            "name": "Nasi Sate Sapi",
            'image': "assets/tenant_dummy/raja_sate/sate-sapi.jpg",
            'deskripsi': 'disajikan dengan saus kacang\natau saus kecap, serta dilengkapi\ndengan irisan bawang merah, timun,\ndan lontong atau nasi putih\nsebagai pelengkapnya',
            'harga': 38000
          },
        ]
      }
    ];

    final tenant = restAreaTenants.firstWhere((tenant) => tenant['id'] == tenantId);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: tenant['menu'].length,
      itemBuilder: (context, index) {
        return _buildMenuItem(context, tenant['menu'][index]);
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, Map<String, dynamic> menuItem) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          menuItem['image'],
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          menuItem['name'],
          style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          menuItem['deskripsi'],
          style: GoogleFonts.nunito(fontSize: 14),
        ),
        trailing: Text(
          'Rp ${menuItem['harga']}',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
