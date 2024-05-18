import 'package:customer_bengkelly/app/data/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_page/search_page.dart';
import '../../../componen/color.dart';
import '../../../componen/shimmerbooking.dart';
import '../../../data/data_endpoint/history.dart';
import '../../../routes/app_pages.dart';
import '../componen/listhistory.dart';
import '../controllers/history_controller.dart';

class HistoryView extends StatefulWidget {
  HistoryView({Key? key}) : super(key: key);

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late List<RefreshController> _refreshControllers;

  @override
  void initState() {
    super.initState();
    _refreshControllers = List.generate(7, (index) => RefreshController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'History',
          style: TextStyle(
            color: MyColors.appPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.CHAT);
                },
                child: SvgPicture.asset(
                  'assets/icons/massage.svg',
                  width: 26,
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.NOTIFIKASI);
                },
                child: SvgPicture.asset(
                  'assets/icons/notif.svg',
                  width: 26,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: DefaultTabController(
        length: 7,
        child: Column(
          children: [
            InkWell(
              onTap: () => showSearch(
                context: context,
                delegate: SearchPage<DataHis>(
                  items: [], // Placeholder for search items
                  searchLabel: 'Cari Booking',
                  searchStyle: TextStyle(color: Colors.black),
                  showItemsOnEmpty: true,
                  failure: Center(
                    child: Text(
                      'Booking Tidak Ditemukan :(',
                      style: TextStyle(),
                    ),
                  ),
                  filter: (booking) => [
                    booking.noPolisi,
                  ],
                  builder: (booking) => ListHistory(
                    booking: booking,
                  ),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                  border: Border.all(color: MyColors.select),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search_rounded, color: MyColors.appPrimaryColor),
                    SizedBox(width: 10),
                    Text('Cari Transaksi', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
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
                  _buildTab('Semua'),
                  _buildTab('Approve'),
                  _buildTab('Diproses'),
                  _buildTab('Estimasi'),
                  _buildTab('Invoice'),
                  _buildTab('Lunas'),
                  _buildTab('Ditolak'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent('Semua', 0),
                  _buildTabContent('Approve', 1),
                  _buildTabContent('Diproses', 2),
                  _buildTabContent('Estimasi', 3),
                  _buildTabContent('Invoice', 4),
                  _buildTabContent('Lunas', 5),
                  _buildTabContent('Ditolak', 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    return Tab(
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: MyColors.select, width: 1),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }

  Widget _buildTabContent(String status, int index) {
    return FutureBuilder<HistoryBooking>(
      future: API.HistoryBookingID(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            itemCount: 5, // Number of shimmer items
            itemBuilder: (context, index) {
              return const ShimmerListHistory();
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.datahistory!.isEmpty) {
          return Center(child: Text('No data available'));
        }

        var bookings = snapshot.data!.datahistory;
        var filteredBookings = bookings?.where((booking) {
          if (status == 'Semua') return true;
          return booking.namaStatus == status;
        }).toList();

        return SmartRefresher(
          controller: _refreshControllers[index],
          enablePullDown: true,
          header: const WaterDropHeader(),
          onRefresh: () => _onRefresh(index),
          child: SingleChildScrollView(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 475),
                childAnimationBuilder: (widget) => SlideAnimation(
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: filteredBookings!.map((booking) {
                  return ListHistory(booking: booking); // Use the new widget
                }).toList(),
              ),
            ),
          ),

        );},
    );
  }

  void _onRefresh(int index) async {
    try {
      await API.HistoryBookingID();
      _refreshControllers[index].refreshCompleted();
    } catch (e) {
      _refreshControllers[index].refreshFailed();
      print('Error during refresh: $e');
    }
  }
}