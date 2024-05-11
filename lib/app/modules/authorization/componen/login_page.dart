import 'package:customer_bengkelly/app/modules/authorization/componen/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../componen/color.dart';
import '../../../componen/custom_widget.dart';
import '../../../routes/app_pages.dart';
import 'common.dart';
import 'fade_animationtest.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg_welcome.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              height: 700,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white
                        .withOpacity(0.0), // Warna transparan di bagian atas
                    Colors.white
                        .withOpacity(0.9), // Warna pudar di bagian bawah
                    Colors.white, // Warna pudar di bagian bawah
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInAnimation(
                            delay: 1.3,
                            child: Text(
                              "Selamat Datang!",
                              style: Common().titelTheme,
                            ),
                          ),
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
                                controller:
                                    _emailController, // Tambahkan controller untuk TextFormField
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeInAnimation(
                              delay: 2.2,
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: obscureText,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  hintText: "Masukkan kata sandi Anda",
                                  hintStyle: Common().hinttext,
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: togglePasswordVisibility,
                                    icon: Icon(
                                      obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FadeInAnimation(
                              delay: 2.5,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                   Get.toNamed(Routes.LUPAPASSWORD);
                                  },
                                  child: Text(
                                    "Lupa Password ?",
                                    style: Common().semiboldblack,
                                  ),
                                ),
                              ),
                            ),
                            FadeInAnimation(
                              delay: 2.8,
                              child: CustomElevatedButton(
                                message: "Masuk",
                                function: () async {
                                  HapticFeedback.lightImpact();
                                  Get.toNamed(Routes.HOME);
                                },
                                color: MyColors.appPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const FadeInAnimation(
                      delay: 3.2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, right: 30, left: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SvgPicture.asset(
                            //     "assets/images/facebook_ic (1).svg"),
                            // SvgPicture.asset(
                            //     "assets/images/google_ic-1.svg"),
                            // Image.asset("assets/images/Vector.png")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    FadeInAnimation(
                      delay: 3.6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Tidak punya Akun ?",
                              style: Common().hinttext,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(const SignupPage());
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
          ),
        ),
      ),
    );
  }
}
