import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/app/core/widget/global_widget.dart';
import 'package:flutter_starter_kit/app/modules/main/main_controller.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const String routeName = "/main";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MainController controller = Get.put(MainController());

    return SystemUiOverlayWidget(
      child: Obx(() {
        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: const Icon(Icons.home_filled), label: "home".tr),
              BottomNavigationBarItem(icon: const Icon(Icons.recommend_rounded), label: "pick".tr),
              BottomNavigationBarItem(icon: const Icon(Icons.article_rounded), label: "news".tr),
              BottomNavigationBarItem(icon: const Icon(Icons.insert_chart_rounded), label: "plan".tr),
              BottomNavigationBarItem(icon: const Icon(Icons.account_circle_rounded), label: "account".tr),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: theme.scaffoldBackgroundColor,
            currentIndex: controller.selectedIndex.value,
            onTap: (value) {
              controller.selectedIndex.value = value;
            },
          ),
        );
      }),
    );
  }
}

List<Widget> _pages = [
  Center(child: Text("home".tr)),
  Center(child: Text("pick".tr)),
  Center(child: Text("news".tr)),
  Center(child: Text("plan".tr)),
  Center(child: Text("account".tr)),
];
