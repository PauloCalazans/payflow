import 'package:flutter/material.dart';

import '../../modules/login/login_controller.dart';
import '../../../../shared/themes/themes.dart';
import '../../../../shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * .3,
              color: AppColors.primary,
            ),

            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                  AppImages.person,
                  width: 208,
                  height: 300
              )
            ),

            Positioned(
              bottom: size.height * .05,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(AppImages.logoMini),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleHome
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSigin(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
