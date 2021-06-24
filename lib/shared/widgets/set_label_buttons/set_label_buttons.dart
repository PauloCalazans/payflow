import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import '../../../shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String firstLabel;
  final VoidCallback firstOnPressed;
  final String secondLabel;
  final VoidCallback secondOnPressed;
  final bool enablePrimaryColor;

  const SetLabelButtons({
      Key? key,
      required this.firstLabel,
      required this.firstOnPressed,
      required this.secondLabel,
      required this.secondOnPressed,
      this.enablePrimaryColor = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: firstLabel,
              onPressed: firstOnPressed,
              style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
            ),
          ),

          VerticalDivider(
            thickness: 1,
            width: 1,
            color: AppColors.stroke,
          ),

          Expanded(
            child: LabelButton(
                label: secondLabel,
                onPressed: secondOnPressed
            ),
          ),
        ],
      ),
    );
  }
}
