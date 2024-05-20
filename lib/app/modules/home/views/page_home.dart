import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:customer_bengkelly/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/data_endpoint/news.dart';
import '../../../data/dummy_data.dart';
import '../../../data/endpoint.dart';
import '../../news/componen/news.dart';
import '../../news/componen/todaydeals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String _currentAddress = 'Mengambil lokasi...';
  Position? _currentPosition;
  final List<String> imgList = [
    'assets/images/slide-2.jpg',
    'assets/images/slide-3.jpg',
    'assets/images/slider1.png',
    'assets/images/promo1.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    var status = await Permission.location.status;
    print('Permission status: $status');
    if (status.isGranted) {
      print('Permission already granted');
      await _getCurrentLocation();
    } else {
      var requestedStatus = await Permission.location.request();
      print('Requested permission status: $requestedStatus');
      if (requestedStatus.isGranted) {
        print('Permission granted');
        await _getCurrentLocation();
      } else {
        print('Permission denied');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Permission denied'),
        ));
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print('Current position: $_currentPosition');
      _getAddressFromLatLng();
      setState(() {});
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.subAdministrativeArea}";
      });
    } catch (e) {
      print('Error getting address: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: MyColors.appPrimaryColor,
          ),
          title: Row(
            children: [
              SvgPicture.asset('assets/icons/lokasi.svg', width: 26),
              SizedBox(width: 10),
              Expanded( // Gunakan Expanded atau Flexible di sini
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lokasi Saat ini', style: TextStyle(fontSize: 12)),
                    Text(
                      _currentAddress,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.CHAT);
                  },
                  child: SvgPicture.asset('assets/icons/massage.svg', width: 26),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.NOTIFIKASI);
                  },
                  child: SvgPicture.asset('assets/icons/notif.svg', width: 26),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 475),
              childAnimationBuilder: (widget) => SlideAnimation(
                child: SlideAnimation(
                  child: widget,
                ),
              ),
              children: [
                _Slider(context),
                SizedBox(height: 20),
                _sectionTitle2('Menu'),
                SizedBox(height: 20),
                _menuItemsRow(),
                SizedBox(height: 20),
                _menuItemsRow2(),
                SizedBox(height: 20),
                _sectionTitle('Lokasi Bengkelly'),
                SizedBox(height: 20),
                _SliderLokasi(context),
                SizedBox(height: 20),
                _sectionTitle('Spesialis Offer'),
                SizedBox(height: 20),
                _SliderOffer(context),
                SizedBox(height: 20),
                _sectionTitle('Today Deals'),
                SizedBox(height: 20),
                TodayDeals(),
                SizedBox(height: 40),
                // _sectionTitle('News'),
                // SizedBox(height: 20),
                // News(),
              ],
            ),
          ),
        ),
      ),
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
          items: imgList.map((item) => Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:  AssetImage(item),
                fit: BoxFit.cover,
              ),
            ),
          )).toList(),
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
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 19.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  color: _currentIndex == index ? MyColors.appPrimaryColor : MyColors.slider,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _menuItemsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _menuItemHelp(() => Get.toNamed(Routes.EMERGENCY), 'assets/icons/help.png', "Emergency\nService"),
        _menuItem(() => Get.toNamed(Routes.BOOKING), 'assets/icons/bookingservice.png', "Booking\nService"),
        _menuItem(() => Get.toNamed(Routes.BOOKING), 'assets/icons/repear.png', "Repair &\nMaintenance"),
        _menuItem(() => Get.toNamed(Routes.LOKASIBENGKELLY), 'assets/icons/drop.png', "Lokasi\nBengkelly"),
      ],
    );
  }
  Widget _menuItemsRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _menuItemCharger(() => Get.toNamed(Routes.LOKASIBENGKELLY), 'assets/icons/dropcar.svg', "Lokasi\nCar Charger"),
        _menuItemCharger(() =>'', "",''),
        _menuItemCharger(() =>'', "",''),
        _menuItemCharger(() =>'', "",''),
      ],
    );
  }

  Widget _menuItem( VoidCallback onTap, String iconPath, String label,) {
    return InkWell(
      onTap: onTap,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(iconPath, width: 50),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
  Widget _menuItemHelp(VoidCallback onTap, String iconPath, String label,) {
    return InkWell(
      onTap: onTap,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(iconPath, width: 50),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
  Widget _menuItemCharger(VoidCallback onTap,String iconPath, String label) {
    return InkWell(
      onTap: onTap,
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(iconPath, width: 60),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: MyColors.appPrimaryColor)),
          Text('Lihat Semua', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
  Widget _sectionTitle2(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: MyColors.appPrimaryColor)),
        ],
      ),
    );
  }

  Widget _SliderLokasi(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.7,
          ),
          items: restAreaPlace.map((area) {
            return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAILLOKASIBENGKELLY,
                          arguments:
                          {
                            'description': area['description'],
                            'name': area['name'],
                            'sliderImages': area['sliderImages'],
                          }
                      );
                    },
                    child:
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 10, top: 20, bottom: 20),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: [
                            ClipOval(
                            child:  Image.asset(
                            area['logo'],
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50),
                            ),
                              SizedBox(width: 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(area['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text(area['address'], style: TextStyle(fontWeight: FontWeight.normal)),
                                    SizedBox(height: 10,),
                                    SvgPicture.asset('assets/icons/icond.svg', width: 60,),
                                  ]
                              )
                            ])
                          ]
                      ),
                    ),
                  );
                }
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _SliderOffer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 1.2,
            viewportFraction: 0.5533,  // Kira-kira sepertiga
            enlargeCenterPage: false,  // Opsi ini memperbesar item di tengah
          ),
          items: dataProduct.map((product) {
            return Builder(
                builder: (BuildContext context) {
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
                      child:
                      Container(
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
                            Image.asset(product['image'], fit: BoxFit.cover, height: 120),
                            SizedBox(height: 20),
                            Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(product['Harga'], style: TextStyle(color: Colors.green)),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: MyColors.green
                                  ),
                                  child: Text('${product['diskon']}',style: TextStyle(color: Colors.white),),
                                ),
                                SizedBox(width: 10,),
                                Text('Rp ${product['harga_asli']}',style: TextStyle(decoration: TextDecoration.lineThrough,),),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(children: [
                              Icon(Icons.star, color: Colors.yellow,),
                              SizedBox(width: 5,),
                              Text('4.9 ${product['terjual']} Terjual',style: TextStyle(color: Colors.grey),),
                            ],),
                            Row(children: [
                              Icon(Icons.shield_moon_rounded, color: Colors.green,),
                              SizedBox(width: 5,),
                              Text('Dilayani Bengkelly',style: TextStyle(color: Colors.grey),),
                            ],),
                          ],
                        ),
                      )
                  );
                }
            );
          }

          ).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
