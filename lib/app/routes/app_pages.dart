import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/bottom-menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom-menu/views/bottom_menu_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/create_kategori_view.dart';
import '../modules/kategori/views/edit_kategori_view.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/kategori/views/show_kategori_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pasien/bindings/pasien_binding.dart';
import '../modules/pasien/views/create_pasien_view.dart';
import '../modules/pasien/views/edit_pasien_view.dart';
import '../modules/pasien/views/pasien_view.dart';
import '../modules/pasien/views/show_pasien_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_MENU;


  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN,
      page: () => PasienView(),
      binding: PasienBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => const KategoriView(),
      binding: KategoriBinding(),
      children: [
        GetPage(
          name: _Paths.TambahKategori,
          page: () => CreateKategoriView(),
        ),
        GetPage(
          name: _Paths.EditKategori,
          page: () => EditKategoriView(kategoris: Get.arguments),
        ),
        GetPage(
          name: _Paths.ShowKategori,
          page: () => ShowKategoriView(kategoris: Get.arguments),
        ),
        GetPage(
          name: _Paths.PASIEN,
          page: () => PasienView(),
          binding: PasienBinding(),
        ),
        GetPage(
          name: _Paths.TambahPasien,
          page: () => TambahPasienView(),
        ),
        GetPage(
          name: _Paths.EditPasien,
          page: () => EditPasienView(pasien: Get.arguments),
        ),
        GetPage(
          name: _Paths.DetailPasien,
          page: () => DetailPasienView(pasien: Get.arguments),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () =>  BottomMenuView(),
      binding: BottomMenuBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
