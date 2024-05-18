import 'package:customer_bengkelly/app/modules/profile/componen/widgets/listkendaraan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../componen/color.dart';
import '../../../data/data_endpoint/customkendaraan.dart';
import '../../../data/endpoint.dart';

class PilihKendaraan extends StatefulWidget {
  const PilihKendaraan({super.key});

  @override
  State<PilihKendaraan> createState() => _PilihKendaraanState();
}

class _PilihKendaraanState extends State<PilihKendaraan> {
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
              child:
            ElevatedButton(
              onPressed: () async {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.appPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 4.0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Icon(Icons.add, color: Colors.white,),
                SizedBox(width: 10,),
                Text(
                  'Tambah Kendaraan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],)
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
        title:  Text('Pilih Kendaraan', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(child:
      Column(children: [
        FutureBuilder(
          future: API.PilihKendaraan(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting &&
                snapshot.data != null) {
              CustomerKendaraan getDataAcc = snapshot.data as CustomerKendaraan;
              return Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 475),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: getDataAcc.datakendaraan != null
                      ? getDataAcc.datakendaraan!.map((e) {
                    return ListKendaraan(item: e);
                  }).toList()
                      : [Container()],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
      ],
      ),
      ),
    );
  }
}
