import 'package:flutter_starter_kit/app/modules/main/main_view.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = MainView.routeName;

  static final routes = [
    GetPage(
      name: MainView.routeName,
      page: () => const MainView(),
    ),
  ];
}