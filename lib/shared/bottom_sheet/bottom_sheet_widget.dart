import 'package:flutter/material.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

import '../../shared/themes/themes.dart';

class BottomSheetWidget extends StatelessWidget {
  final String firstLabel;
  final VoidCallback firstOnPressed;
  final String secondLabel;
  final VoidCallback secondOnPressed;
  final String title;
  final String subTitle;

  const BottomSheetWidget({
    Key? key,
    required this.firstLabel,
    required this.firstOnPressed,
    required this.secondLabel,
    required this.secondOnPressed,
    required this.title,
    required this.subTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(.6)
                  )
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: title),
                            TextSpan(text: "\n$subTitle", style: AppTextStyles.buttonHeading),
                          ]
                        ),
                        style: AppTextStyles.buttonBoldHeading,
                        textAlign: TextAlign.center
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      firstLabel: firstLabel,
                      firstOnPressed: firstOnPressed,
                      secondLabel: secondLabel,
                      secondOnPressed: secondOnPressed
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
