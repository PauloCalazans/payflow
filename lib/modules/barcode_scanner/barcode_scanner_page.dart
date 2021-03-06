import 'package:flutter/material.dart';
import 'barcode_scanner_controller.dart';
import 'barcode_scanner_status.dart';
import '../../../shared/bottom_sheet/bottom_sheet_widget.dart';
import '../../../shared/themes/themes.dart';
import '../../../shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    super.initState();
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if(controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto", arguments: controller.status.barcode);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if(status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            }
          ),

          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "Escanei o código de barras do boleto",
                  style: AppTextStyles.buttonBackground,
                ),
                centerTitle: true,
                leading: BackButton(color: AppColors.background),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(.6),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    )
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.black.withOpacity(.6),
                      )
                  )
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                firstLabel: "Inserir código do boleto",
                firstOnPressed: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                secondLabel: "Adicionar da galeria",
                secondOnPressed: controller.scanWithImagePicker,
              )
            ),
          ),

          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if(status.hasError) {
                  return BottomSheetWidget(
                    title: "Não foi possível identificar um código de barras.",
                    subTitle: "Tente escanear novamente ou digite o código do seu boleto",
                    firstLabel: "Escanear Novamente",
                    firstOnPressed: controller.scanWithCamera,
                    secondLabel: "Digitar código",
                    secondOnPressed: () {
                      Navigator.pushReplacementNamed(context, "/insert_boleto");
                    },
                  );
                } else {
                  return Container();
                }
              }
          ),
        ],
      ),
    );
  }
}
