import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../../../shared/models/boleto_model.dart';
import '../../../../shared/themes/themes.dart';
import '../../../../shared/widgets/boleto_info/boleto_info_widget.dart';
import '../../../../shared/widgets/boleto_list/boleto_list_controller.dart';
import '../../../../shared/widgets/boleto_list/boleto_list_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          child: Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInfoWidget(size: boletos.length)
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
          child: Row(
            children: [
              Text(
                "Meus Boletos",
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
