import 'package:flutter/material.dart';
import 'package:grocery_app/core/ui/color/colors.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    required this.iconData,
    this.color = AppColors.primary,
    required this.press,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: const CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      onPressed: press,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
