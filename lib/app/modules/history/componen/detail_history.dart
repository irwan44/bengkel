import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({super.key});

  @override
  _DetailHistoryState createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final String alamat = arguments['alamat'];
    final String restarea = arguments['nama_cabang'];
    final String namajenissvc = arguments['nama_jenissvc'];
    final String status = arguments['nama_status'];
    final List<dynamic> jasa = arguments['jasa'];
    final List<dynamic> part = arguments['part'];
    Map<String, String> cabangImageAssets = {
      'Bengkelly Rest Area KM 379A': 'assets/logo/379a.jpg',
      'Bengkelly Rest Area KM 228A': 'assets/logo/228a.jpg',
      'Bengkelly Rest Area KM 389B': 'assets/logo/389b.jpg',
      'Bengkelly Rest Area KM 575B': 'assets/logo/575b.jpg',
      'Bengkelly Rest Area KM 319B': 'assets/logo/319b.jpg',
    };

    String imageAsset = cabangImageAssets[arguments['nama_cabang']] ?? 'assets/images/default.png';

    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
        title: Text(
          'Detail History',
          style: GoogleFonts.nunito(
              color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
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
                child: Column(children: [
                 Text('Status Pesanan ${status}', style: GoogleFonts.nunito(fontWeight: FontWeight.bold,color: MyColors.appPrimaryColor),),
                ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(children: [
                  ClipOval(
                    child:  Image.asset(
                      imageAsset,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
              _buildDetailStep(
                icon: Icons.location_on,
                title: restarea,
                subtitle: alamat,
              ),
              _buildDetailStep(
                icon: Icons.build,
                title: 'Detail Jasa',
                child: _buildDetailList(jasa, 'nama_jasa', 'tgl', 'harga'),
              ),
              _buildDetailStep(
                icon: Icons.settings,
                title: 'Detail Part',
                child: _buildDetailList(part, 'nama_sparepart', 'kode_sparepart', 'harga'),
              ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailStep({required IconData icon, required String title, String? subtitle, Widget? child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Column(
            children: [
              Icon(icon),
              SizedBox(height: 10),
              Container(
                width: 4,
                height: subtitle != null ? 87 : 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null) ...[
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: MyColors.appPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: MyColors.appPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ] else ...[
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: MyColors.appPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (child != null) child,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailList(List<dynamic> items, String titleKey, String subtitleKey, String trailingKey) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(
            item[titleKey],
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.green,
            ),
          ),
          subtitle: Text(
            'Tanggal: ${item[subtitleKey]}',
            style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            'Harga: ${item[trailingKey]}',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }
}
