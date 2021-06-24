import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_page.dart';
import '../modules/login/login_page.dart';
import '../../shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {

  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitDown
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => SplashPage(),
        "/home": (_) => HomePage(),
        "/login": (_) => LoginPage(),
        "/barcode_scanner": (_) => BarcodeScannerPage(),
        "/insert_boleto": (_) => InsertBoletoPage(),
      },
    );
  }
}
