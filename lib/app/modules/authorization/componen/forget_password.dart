import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../../componen/color.dart';
import '../../../componen/custom_widget.dart';
import '../../../data/endpoint.dart';
import '../../../routes/app_pages.dart';
import '../controllers/authorization_controller.dart';
import '../router/router.dart';
import 'common.dart';
import 'fade_animationtest.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final AuthorizationController controller = Get.put(AuthorizationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInAnimation(
                      delay: 1.3,
                      child: Text(
                        "Tidak ingat kata sandi?",
                        style: Common().titelTheme,
                      ),
                    ),
                    FadeInAnimation(
                      delay: 1.6,
                      child: Text(
                        "Jangan khawatir! Ini terjadi. Silakan masukkan alamat email yang tertaut dengan akun Anda.",
                        style: Common().mediumThemeblack,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  child: Column(
                    children: [
                      FadeInAnimation(
                        delay: 1.9,
                        child: CustomTextFormField(
                          hinttext: 'Masukkan email Anda',
                          obsecuretext: false,
                          controller: controller.LupaPasswordController,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInAnimation(
                        delay: 2.1,
                        child: CustomElevatedButton(
                          message: "Kirim Kode",
                          function: () async {
                            if (controller.LupaPasswordController.text.isNotEmpty ) {
                              try {
                                String? token = (await API.LupaPasswordID(
                                  email: controller.LupaPasswordController.text,
                                )) as String?;

                                if (token != null) {
                                  Get.offAllNamed(Routes.NEWPASSWORD);
                                } else {
                                  Get.snackbar('Error', 'Terjadi kesalahan saat login',
                                      backgroundColor: Colors.redAccent,
                                      colorText: Colors.white
                                  );
                                }
                              } catch (e) {
                                print('Error during login: $e');
                                Get.offAllNamed(Routes.NEWPASSWORD);
                              }
                            } else {
                              Get.snackbar('Gagal Login', 'Username dan Password harus diisi',
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white
                              );
                            }
                          },
                          color: MyColors.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
