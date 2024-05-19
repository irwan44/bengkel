import 'package:get/get.dart';

import '../modules/authorization/bindings/authorization_binding.dart';
import '../modules/authorization/componen/forget_password.dart';
import '../modules/authorization/componen/login_page.dart';
import '../modules/authorization/componen/signup_next.dart';
import '../modules/authorization/componen/signup_page.dart';
import '../modules/authorization/views/authorization_view.dart';
import '../modules/booking/bindings/booking_binding.dart';
import '../modules/booking/componen/detailbooking.dart';
import '../modules/booking/componen/select_maps.dart';
import '../modules/booking/views/booking_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/detail/detailbengkelly/lokasibengkelly.dart';
import '../modules/home/detail/detailspesialis/spesialisofer.dart';
import '../modules/home/menu/booking_service.dart';
import '../modules/home/menu/emergency_service.dart';
import '../modules/home/menu/lokasi_bengkelly.dart';
import '../modules/home/menu/lokasi_car_charger.dart';
import '../modules/home/menu/repair&maintenance.dart';
import '../modules/home/views/home_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/componen/edit_profile.dart';
import '../modules/profile/componen/pengaturan.dart';
import '../modules/profile/componen/pilih_kendaraan.dart';
import '../modules/profile/componen/pusat_bantuan.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHORIZATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHORIZATION,
      page: () => const AuthorizationView(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.SINGIN,
      page: () => LoginPage(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.SINGUP,
      page: () => SignupPage(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.SINGUPNEXT,
      page: () => RegisterPage(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.LUPAPASSWORD,
      page: () => ForgetPasswordPage(),
      binding: AuthorizationBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.CHAT,
      page: () => const HelpCenterPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.NOTIFIKASI,
      page: () => const NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.BOOKING,
      page: () => BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: _Paths.SELECTBOOKING,
      page: () => SelectBooking(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.EMERGENCY,
      page: () => const EmergencyService(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.BOOKINGSERVICE,
      page: () => const BookingService(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.REPAIRMAINTENANCE,
      page: () => const RepairMaintenance(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.LOKASIBENGKELLY,
      page: () => const LokasiBengkelly(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.LOKASICHARGER,
      page: () => const LokasiCarChanger(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.zoom,
      name: _Paths.EDITPROFILE,
      page: () => const EditProfile(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.PENGATURAN,
      page: () => const Pengaturan(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.PILIHKENDARAAN,
      page: () => const PilihKendaraan(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.BANTUAN,
      page: () => const Bantuan(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.DETAILLOKASIBENGKELLY,
      page: () => DetailLokasiBengkelly(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.DETAILSPECIAL,
      page: () => DetailSpecialOffer(),
      binding: BookingBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeftWithFade,
      name: _Paths.DETAILBOOKING,
      page: () => DetailBookingView(),
      binding: BookingBinding(),
    ),
  ];
}
