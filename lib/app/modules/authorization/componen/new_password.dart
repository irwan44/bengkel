import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import '../../../componen/custom_widget.dart';
import '../../../data/endpoint.dart';
import '../../../routes/app_pages.dart';
import '../controllers/authorization_controller.dart';
import '../router/router.dart';
import 'common.dart';
import 'fade_animationtest.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
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
      body: SingleChildScrollView(
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
                        "Buat kata sandi baru",
                        style: Common().titelTheme,
                      ),
                    ),
                    FadeInAnimation(
                      delay: 1.6,
                      child: Text(
                        "Kata sandi baru Anda harus unik dari yang digunakan sebelumnya.",
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
                          hinttext: 'Email yang terdaftar',
                          obsecuretext: false,
                          controller: controller.VerikasiEmailController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FadeInAnimation(
                        delay: 1.10,
                        child: CustomTextFormField(
                          hinttext: 'Password baru',
                          obsecuretext: false,
                          controller: controller.VerikasiPassowrdBaruController,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FadeInAnimation(
                        delay: 2.1,
                        child: CustomTextFormField(
                          hinttext: 'Confirm password baru',
                          obsecuretext: false,
                          controller: controller.VerikasiPassowrdBarulagiController,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeInAnimation(
                        delay: 2.4,
                        child: CustomElevatedButton(
                          message: "Reset Password ",
                          function: () async {
                            if (controller.VerikasiEmailController.text.isNotEmpty &&
                                controller.VerikasiEmailController.text.isNotEmpty &&
                                controller.VerikasiPassowrdBarulagiController.text.isNotEmpty
                            ) {
                              try {
                                String? token = (await API.ResetPasswordID(
                                  email: controller.VerikasiEmailController.text,
                                  password:  controller.VerikasiEmailController.text,
                                  passwordconfirmation:  controller.VerikasiPassowrdBarulagiController.text,
                                )) as String?;

                                if (token != null) {
                                } else {
                                  Get.snackbar('Gagal Reset Password', 'Password baru anda mungkin sama dengan passoword yang sudah ada',
                                      backgroundColor: Colors.redAccent,
                                      colorText: Colors.white
                                  );
                                }
                              } catch (e) {
                                print('Error during login: $e');
                                Get.offAllNamed(Routes.NEWPASSWORD);
                              }
                            } else {
                              Get.snackbar('Gagal Reset Password', 'Email anda mungkin tidak terdaftar / typo',
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
              FadeInAnimation(
                delay: 2.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?",
                        style: Common().hinttext,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SINGUP);
                          },
                          child: Text(
                            "Register Sekarang",
                            style: Common().mediumTheme,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
