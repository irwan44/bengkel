import 'package:customer_bengkelly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/dummy_data.dart';

class LihatSemuaSpesialis extends StatelessWidget {
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
        title: Text('Lihat Semua Spesialis'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth < 600 ? 2 : 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0.8,
                    childAspectRatio: 0.50,
                  ),
                  itemCount: dataProduct.length,
                  itemBuilder: (context, index) {
                    final product = dataProduct[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DETAILSPECIAL,
                            arguments:
                            {
                              'description': product['description'],
                              'name': product['name'],
                              'image': product['image'],
                              'Harga': product['Harga'],
                              'harga_asli': product['harga_asli'],
                              'diskon': product['diskon'],
                            }
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(product['image'], fit: BoxFit.cover, height: 120, width: double.infinity),
                            SizedBox(height: 20),
                            Text(product['name'], style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
                            Text(product['Harga'], style: GoogleFonts.nunito(color: Colors.green)),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green
                                  ),
                                  child: Text('${product['diskon']}', style: GoogleFonts.nunito(color: Colors.white)),
                                ),
                                SizedBox(width: 10),
                                Text('Rp ${product['harga_asli']}', style: GoogleFonts.nunito(decoration: TextDecoration.lineThrough)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 5),
                                Text('4.9 ${product['terjual']} Terjual', style: GoogleFonts.nunito(color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.shield_moon_rounded, color: Colors.green),
                                SizedBox(width: 5),
                                Text('Dilayani Bengkelly', style: GoogleFonts.nunito(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
