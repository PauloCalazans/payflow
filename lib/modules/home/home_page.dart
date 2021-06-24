import 'package:flutter/material.dart';

import '../../modules/home/home_controller.dart';
import '../../../shared/themes/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(text: "Paulo", style: AppTextStyles.titleBoldBackground)
                  ]
                ),
              ),
              subtitle: Text("Mantenha suas contas em dia", style: AppTextStyles.captionShape),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: AppColors.primary,
              )
            ),
            InkWell(
              onTap: () {
                controller.setPage(0);
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/barcode_scanner');
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    )
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
              },
              icon: Icon(
                Icons.description_outlined,
                color: AppColors.body,
              )
            )
          ],
        ),
      ),
    );
  }
}
