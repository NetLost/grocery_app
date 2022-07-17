import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/core/ui/components/round_icon_button.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          RoundIconButton(
            iconData: Icons.remove,
            color: Colors.black38,
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstant.defaultPadding / 4,
            ),
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          RoundIconButton(
            iconData: Icons.add,
            press: () {},
          )
        ],
      ),
    );
  }
}
