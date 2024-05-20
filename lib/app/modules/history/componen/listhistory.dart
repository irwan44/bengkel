import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';

import '../../../data/data_endpoint/history.dart';
import '../../../data/endpoint.dart';

class ListHistory extends StatelessWidget {
  final DataHis booking;
  final VoidCallback onTap;
  const ListHistory({super.key, required this.booking, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color statusColor = StatusColor.getColor(booking.namaStatus ?? '');

    // Mapping namaCabang to corresponding image assets
    Map<String, String> cabangImageAssets = {
      'Bengkelly Rest Area KM 379A': 'assets/logo/379a.jpg',
      'Bengkelly Rest Area KM 228A': 'assets/logo/228a.jpg',
      'Bengkelly Rest Area KM 389B': 'assets/logo/389b.jpg',
      'Bengkelly Rest Area KM 575B': 'assets/logo/575b.jpg',
      'Bengkelly Rest Area KM 319B': 'assets/logo/319b.jpg',
    };

    // Default image if namaCabang does not match any key
    String imageAsset = cabangImageAssets[booking.namaCabang] ?? 'assets/images/default.png';

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${booking.namaJenissvc}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: statusColor,
                  ),
                  child: Text(
                    '${booking.namaStatus}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ClipOval(
                  child:  Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${booking.namaCabang}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 280,
                      child:
                    Text(
                      '${booking.alamat}',
                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatusColor {
  static Color getColor(String status) {
    switch (status.toLowerCase()) {
      case 'booking':
        return Colors.blue;
      case 'approve':
        return Colors.green;
      case 'diproses':
        return Colors.orange;
      case 'estimasi':
        return Colors.lime;
      case 'selesai dikerjakan':
        return Colors.blue;
      case 'pkb':
        return Colors.yellow;
      case 'pkb tutup':
        return Colors.yellow;
      case 'invoice':
        return Colors.yellow;
      case 'lunas':
        return Colors.yellow;
      case 'ditolak by sistem':
        return Colors.grey;
      case 'ditolak':
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }
}
