import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';

import '../../../data/data_endpoint/history.dart';
import '../../../data/endpoint.dart';

class ListHistory extends StatelessWidget {
  final DataHis booking;
  const ListHistory({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                        color: MyColors.appPrimaryColor,
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
                  color: getStatusColor(booking.namaStatus??''),
                  boxShadow: [
                    BoxShadow(
                      color: getStatusColor(booking.namaStatus??'').withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
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
    );
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approve':
        return Colors.green;
      case 'diproses':
        return Colors.orange;
      case 'estimasi':
        return MyColors.appPrimaryColor;
      case 'invoice':
        return Colors.blue;
      case 'lunas':
        return Colors.blue;
      case 'ditolak':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
