import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/history_controller.dart';


class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text('History', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CHAT);
                    },
                    child:
                    SvgPicture.asset('assets/icons/massage.svg', width: 26,),),
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFIKASI);
                    },
                    child:
                    SvgPicture.asset('assets/icons/notif.svg', width: 26,),),
                  SizedBox(width: 10,),
                ],),
            ],
          ),
          body: DefaultTabController(
            length: 6,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(right: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                      border: Border.all(color: MyColors.select)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                    Icon(Icons.search_rounded, color: MyColors.appPrimaryColor,),
                      SizedBox(width: 10,),
                      Text('Cari Transaksi', style: TextStyle(color: Colors.grey),)
                  ],),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
                  child: TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    labelColor: MyColors.appPrimaryColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.select,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: MyColors.select, width: 1)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Semua')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: MyColors.select, width: 1)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Diproses')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: MyColors.select, width: 1)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Invoice')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: MyColors.select, width: 1)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Lunas')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: MyColors.select, width: 1)),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Ditolak')),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  //child: Container(
                  height: 200,
                  //color: Colors.blue,
                  child: TabBarView(
                    children: [
                      Text('One'),
                      Text('Two'),
                      Text('Three'),
                      Text('Four'),
                      Text('Five'),
                      Text('Six'),
                    ],
                  ),
                ),
                //),
                //Container(),
              ],
            ),
          ),
        );
  }
}
