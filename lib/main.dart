import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:swastik_air_hub/controller/booking_details_controller.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/detail_confirmation_page.dart';
import 'package:swastik_air_hub/pages/homepage/main_home_page.dart';
import 'package:swastik_air_hub/pages/homepage/navigation.dart';
import 'package:swastik_air_hub/pages/search_flight_page/main_search_flight_page.dart';
import 'package:swastik_air_hub/pages/show_payment_method/show_payment_method_page.dart';
import 'package:swastik_air_hub/pages/sign_in_page/sign_in.dart';
import 'package:swastik_air_hub/pages/sign_up_page/sign_up.dart';
import 'package:swastik_air_hub/pages/trip_summary/trip_summary_page.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(Get.find<CustomerBookingDetailController>().customerBookingDetails);

    return KhaltiScope(
        publicKey: "test_public_key_30e12814fed64afa9a7d4a92a2194aeb",
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            theme: ThemeData(
                primaryColor: const Color(0xFF56328c),
                appBarTheme: const AppBarTheme(
                  color: Color(0xFF56328c),
                )),
            debugShowCheckedModeBanner: false,
            title: 'SwastikAirhub',
            home: const SignInPage(),
            getPages: RouteHelper.routes,
          );
        });
  }
}
