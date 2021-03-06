import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/shared/models/user_model.dart';

import '../../shared/themes/app_colors.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import '../modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {

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
        "/home": (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/login": (_) => LoginPage(),
        "/barcode_scanner": (_) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
          barcode: ModalRoute.of(context) != null ? ModalRoute.of(context)!.settings.arguments as String : null,
        ),
      },
    );
  }
}
