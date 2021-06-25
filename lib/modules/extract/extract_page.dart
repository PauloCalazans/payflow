import 'package:flutter/material.dart';

import '../../../../shared/themes/themes.dart';
import '../../../../shared/widgets/boleto_list/boleto_list_controller.dart';
import '../../../../shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
          child: Row(
            children: [
              Text(
                "Meus Extratos",
                style: AppTextStyles.titleBoldHeading,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
          child: Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
        ),
        BoletoListWidget(controller: controller)
      ],
    );
  }
}
