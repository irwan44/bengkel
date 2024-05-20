import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/data_endpoint/history.dart';
import '../../../data/endpoint.dart';

class DetailHistory extends StatelessWidget {
  const DetailHistory({super.key,});
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final String kodeSvc = arguments['alamat'];
    final String restarea = arguments['nama_cabang'];
    final String namajenissvc = arguments['nama_jenissvc'];
    final List<dynamic> jasa = arguments['jasa'];
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
        title: const Text('Notifikasi'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            namajenissvc,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            restarea,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            kodeSvc,
            style: TextStyle(fontSize: 20),
          ),
      Text(
        'Jasa:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Expanded(
        child: ListView.builder(
          itemCount: jasa.length,
          itemBuilder: (context, index) {
            final item = jasa[index];
            return ListTile(
              title: Text(item['nama_jasa']),
              subtitle: Text('Kode Jasa: ${item['kode_jasa']}\nTanggal: ${item['tgl']}'),
              trailing: Text('Harga: ${item['harga']}'),
            );
          },
        ),
      )
        ],
      ),
    );
  }
}