import 'package:apotech/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: "Application",
        initialRoute: Routes.WALKTHROUGH,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Overpass',
          useMaterial3: true,
        ),
      ),
    ),
  );
}
