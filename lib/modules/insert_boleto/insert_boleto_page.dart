import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../modules/insert_boleto/insert_boleto_controller.dart';
import '../../../../shared/widgets/set_label_buttons/set_label_buttons.dart';
import '../../../../shared/themes/themes.dart';
import '../../../../shared/widgets/input_text/input_text_widget.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final moneyInputTextController = MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  final controller = InsertBoletoController();

  @override
  void initState() {
    super.initState();
    if(widget.barcode != null) {
      print('Entrou aqui ${widget.barcode}');
      barcodeInputTextController.text = widget.barcode!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93),
              child: Text(
                "Preencha os dados do boleto",
                style: AppTextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 24),

            InputTextWidget(
              label: "Nome do boleto",
              validator: controller.validateName,
              icon: Icons.description_outlined,
              onChanged: (String value) {
                controller.onChange(name: value);
              },
            ),

            InputTextWidget(
              label: "Vencimento",
              controller: dueDateInputTextController,
              validator: controller.validateVencimento,
              icon: FontAwesomeIcons.timesCircle,
              onChanged: (String value) {
                controller.onChange(dueDate: value);
              },
            ),

            InputTextWidget(
              label: "Valor",
              controller: moneyInputTextController,
              icon: FontAwesomeIcons.wallet,
              validator: (_) => controller.validateValor(moneyInputTextController.numberValue),
              onChanged: (String value) {
                controller.onChange(valor: moneyInputTextController.numberValue);
              },
            ),

            InputTextWidget(
              label: "Código",
              controller: barcodeInputTextController,
              validator: controller.validateCodigo,
              icon: FontAwesomeIcons.barcode,
              onChanged: (String value) {
                controller.onChange(barcode: value);
              },
            )

          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        firstLabel: "Cancelar",
        firstOnPressed: () {
          Navigator.pop(context);
        },
        secondLabel: "Cadastrar",
        secondOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
