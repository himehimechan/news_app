import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:news_app/config/config.dart';
import 'package:news_app/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: true,
            title: "App News",
            theme: appTheme,
            defaultTransition: Transition.fade,
            initialRoute: Routes.root,
            getPages: routes,
          );
        }
    );
  }
}
  