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
    Color statusColor = StatusColor.getColor(booking.namaStatus??'');
    return InkWell(
        onTap: onTap ,
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
                  Text(
                    '${booking.namaCabang}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
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
              Text('No Polisi :'),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  '${booking.noPolisi}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
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
      case 'estimasi':
        return Colors.orange;
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
        return Colors.red;
      case 'ditolak':
        return Colors.red;
      case 'selesai dikerjakan':
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }
}
