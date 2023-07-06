import 'package:flutter/foundation.dart';
import 'package:flutter_starter_kit/app/core/values/app_colors.dart';
import 'package:flutter_starter_kit/app/language/language.dart';
import 'package:flutter_starter_kit/app/routes/app_pages.dart';
import 'package:flutter_starter_kit/flavors/build_config.dart';
import 'package:flutter_starter_kit/flavors/env_config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final EnvConfig envConfig = BuildConfig.instance.config;

    return GetMaterialApp(
      title: envConfig.appName,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: kDebugMode,
      themeMode: ThemeMode.system,
      translations: Language(),
      locale: const Locale("id", "ID"),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.colorLight,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.colorLightPrimary,
          brightness: Brightness.light,
        )
      ),
      darkTheme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.colorDark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.colorDarkPrimary,
          brightness: Brightness.dark,
        )
      ),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
            child: ScrollConfiguration(behavior: _AppScrollBehavior(), child: child!)
        );
      },
    );
  }
}

class _AppScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details) {
    return child;
  }
}
