import 'package:get/get.dart';

import '../modules/admin/account/bindings/account_binding.dart';
import '../modules/admin/account/views/account_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/bridge/bindings/bridge_binding.dart';
import '../modules/admin/bridge/edit_jembatan/bindings/edit_jembatan_binding.dart';
import '../modules/admin/bridge/edit_jembatan/views/edit_jembatan_view.dart';
import '../modules/admin/bridge/edit_kondisi_jembatan/bindings/edit_kondisi_jembatan_binding.dart';
import '../modules/admin/bridge/edit_kondisi_jembatan/views/edit_kondisi_jembatan_view.dart';
import '../modules/admin/bridge/views/bridge_view.dart';
import '../modules/admin/dashboard/bindings/dashboard_binding.dart';
import '../modules/admin/dashboard/views/dashboard_view.dart';
import '../modules/admin/road/bindings/road_binding.dart';
import '../modules/admin/road/edit_informasi_jalan/bindings/edit_informasi_jalan_binding.dart';
import '../modules/admin/road/edit_informasi_jalan/views/edit_informasi_jalan_view.dart';
import '../modules/admin/road/edit_konsisi_jalan/bindings/edit_konsisi_jalan_binding.dart';
import '../modules/admin/road/edit_konsisi_jalan/views/edit_konsisi_jalan_view.dart';
import '../modules/admin/road/views/road_view.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/public/bindings/public_binding.dart';
import '../modules/public/grafik/bindings/grafik_binding.dart';
import '../modules/public/grafik/views/grafik_view.dart';
import '../modules/public/jalan/bindings/jalan_binding.dart';
import '../modules/public/jalan/detail_jalan/bindings/detail_jalan_binding.dart';
import '../modules/public/jalan/detail_jalan/views/detail_jalan_view.dart';
import '../modules/public/jalan/views/jalan_view.dart';
import '../modules/public/jembatan/bindings/jembatan_binding.dart';
import '../modules/public/jembatan/detail_jembatan/bindings/detail_jembatan_binding.dart';
import '../modules/public/jembatan/detail_jembatan/views/detail_jembatan_view.dart';
import '../modules/public/jembatan/views/jembatan_view.dart';
import '../modules/public/kegiatan/bindings/kegiatan_binding.dart';
import '../modules/public/kegiatan/views/kegiatan_view.dart';
import '../modules/public/laporan/bindings/laporan_binding.dart';
import '../modules/public/laporan/views/laporan_view.dart';
import '../modules/public/peta/bindings/peta_binding.dart';
import '../modules/public/peta/views/peta_view.dart';
import '../modules/public/views/public_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PUBLIC,
      page: () => const PublicView(),
      binding: PublicBinding(),
      children: [
        GetPage(
          name: _Paths.PETA,
          page: () => const PetaView(),
          binding: PetaBinding(),
        ),
        GetPage(
          name: _Paths.JALAN,
          page: () => const JalanView(),
          binding: JalanBinding(),
          children: [
            GetPage(
              name: _Paths.DETAIL_JALAN,
              page: () => const DetailJalanView(),
              binding: DetailJalanBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.JEMBATAN,
          page: () => const JembatanView(),
          binding: JembatanBinding(),
          children: [
            GetPage(
              name: _Paths.DETAIL_JEMBATAN,
              page: () => const DetailJembatanView(),
              binding: DetailJembatanBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.KEGIATAN,
          page: () => const KegiatanView(),
          binding: KegiatanBinding(),
        ),
        GetPage(
          name: _Paths.GRAFIK,
          page: () => const GrafikView(),
          binding: GrafikBinding(),
        ),
        GetPage(
          name: _Paths.LAPORAN,
          page: () => const LaporanView(),
          binding: LaporanBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
      children: [
        GetPage(
            name: _Paths.DASHBOARD,
            page: () => const DashboardView(),
            binding: DashboardBinding(),
            bindings: [
              DashboardBinding(),
              RoadBinding(),
              BridgeBinding(),
              AccountBinding(),
            ]),
        GetPage(
          name: _Paths.ROAD,
          page: () => const RoadView(),
          binding: RoadBinding(),
          children: [
            GetPage(
              name: _Paths.EDIT_INFORMASI_JALAN,
              page: () => const EditInformasiJalanView(),
              binding: EditInformasiJalanBinding(),
            ),
            GetPage(
              name: _Paths.EDIT_KONSISI_JALAN,
              page: () => const EditKonsisiJalanView(),
              binding: EditKonsisiJalanBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.BRIDGE,
          page: () => const BridgeView(),
          binding: BridgeBinding(),
          children: [
            GetPage(
              name: _Paths.EDIT_JEMBATAN,
              page: () => const EditJembatanView(),
              binding: EditJembatanBinding(),
            ),
            GetPage(
              name: _Paths.EDIT_KONDISI_JEMBATAN,
              page: () => const EditKondisiJembatanView(),
              binding: EditKondisiJembatanBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.ACCOUNT,
          page: () => const AccountView(),
          binding: AccountBinding(),
        ),
      ],
    ),
  ];
}
