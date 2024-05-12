import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../componen/color.dart';
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
        _logout()
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
              Row(
                children: [
                  Image.asset('assets/images/profile.png', width: 70),
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
                              Text('Irwan Setiawan', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
                              SvgPicture.asset('assets/icons/edit.svg', width: 26),
                            ],
                          ),
                        ),
                        Text('irwanstwn2398@gmail.com', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
                        Text('087724023534', style: TextStyle(color: MyColors.appPrimaryColor, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                ],
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
  Widget _logout() {
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.logout_rounded, color: Colors.red,),
                    SizedBox(width: 10,),
                    Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                  ],),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.redAccent,),
              ],
            ),],
        ),
      ),
    );
  }
}
