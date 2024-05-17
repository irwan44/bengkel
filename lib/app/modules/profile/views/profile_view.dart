import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../componen/ButtonSubmitWidget.dart';
import '../../../componen/color.dart';
import '../../../data/data_endpoint/profile.dart';
import '../../../data/endpoint.dart';
import '../../../data/localstorage.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Profile', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
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
      body: Column(children: [
        _Profile(),
        SizedBox(height: 20,),
        _setting(),
        SizedBox(height: 20,),
        _logout(context)
      ],
      ),
    );
  }


  Widget _Profile() {
    return  InkWell(
        onTap: () {
      Get.toNamed(Routes.EDITPROFILE);
    },
    child:
      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.card,
          borderRadius: BorderRadius.circular(20),
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<Profile>(
                future: API.profileiD(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (snapshot.data != null) {
                      final gambar = snapshot.data!.data?.gambar ?? "";
                      final nama = snapshot.data!.data?.nama ?? "";
                      final email = snapshot.data!.data?.email ?? "";
                      final hp = snapshot.data!.data?.hp ?? "";
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: gambar != null
                                    ? Image.network(
                                  gambar!,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/profile.png',
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                                    : Image.asset(
                                  'assets/images/profile.png',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(  // Membuat kolom menjadi responsif
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(nama, style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
                                          SvgPicture.asset('assets/icons/edit.svg', width: 26),
                                        ],
                                      ),
                                    ),
                                    Text(email, style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
                                    Text(hp, style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Text('Tidak ada data');
                    }
                  }
                },
              ),

            ],
          ),
          ),
    );
  }

  Widget _setting() {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.bg,
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 475),
          childAnimationBuilder: (widget) => SlideAnimation(
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            InkWell(
            onTap: () {
          Get.toNamed(Routes.PILIHKENDARAAN);
      },
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/carset.svg', width: 26,),
                    SizedBox(width: 10,),
                    Text('Pilih Kendaraaan', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],),

                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade400,),
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Divider(color: Colors.grey.shade300,),
            ),
      InkWell(
        onTap: () {
          Get.toNamed(Routes.BANTUAN);
        },
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/tandaseru.svg', width: 26,),
                    SizedBox(width: 10,),
                    Text('Pusat Bantuan', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade400,),
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Divider(color: Colors.grey.shade300,),
            ),
      InkWell(
        onTap: () {
          Get.toNamed(Routes.PENGATURAN);
        },
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/setting.svg', width: 26,),
                    SizedBox(width: 10,),
                    Text('Pengaturan', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey.shade400,),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _logout(BuildContext context) {
    return InkWell(
        onTap: () {
      HapticFeedback.lightImpact();
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(30),
            height: 245,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Continue To Logout?",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Are you sure to logout from this device?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonSubmitWidget1(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      title: "No, cancel",
                      bgColor: Colors.white,
                      textColor: MyColors.appPrimaryColor,
                      fontWeight: FontWeight.normal,
                      width: 70,
                      height: 50,
                      borderSide: Colors.transparent,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonSubmitWidget2(
                      onPressed: () {
                        logout();
                      },
                      title: "Yes, Continue",
                      bgColor: MyColors.appPrimaryColor,
                      textColor: Colors.white,
                      fontWeight: FontWeight.normal,
                      width: 100,
                      height: 50,
                      borderSide: Colors.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    child:
      Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.bg,
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 475),
          childAnimationBuilder: (widget) => SlideAnimation(
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(Routes.SINGIN),
                  child:
                const Row(
                  children: [
                    Icon(Icons.logout_rounded, color: Colors.red,),
                    SizedBox(width: 10,),
                    Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                  ],),),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.redAccent,),
              ],
            ),],
        ),
      ),
      ),
    );
  }
  void logout() {
    // Bersihkan cache untuk setiap data yang Anda simpan dalam cache
    LocalStorages.deleteToken();

    // Navigasi ke halaman login
    Get.offAllNamed(Routes.SINGIN);
  }
}
