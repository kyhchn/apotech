import 'package:apotech/app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: "Application",
        initialRoute: Routes.HOME,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 1,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: purpleText, fontSize: 16, fontWeight: FontWeight.w700),
            iconTheme: IconThemeData(color: purpleText),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: purpleText.withOpacity(0.1)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: purpleText),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Overpass',
          useMaterial3: true,
        ),
      ),
    ),
  );
}
