import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/core/ui/color/colors.dart';
import 'package:grocery_app/features/home_screen/controllers/home_screen_controller.dart';

class CardShortView extends StatelessWidget {
  const CardShortView({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Cart',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          width: AppConstant.defaultPadding,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.cart.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                      right: AppConstant.defaultPadding / 2),
                  child: Hero(
                    tag: '${controller.cart[index].product!.title}_cartTag',
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage(controller.cart[index].product!.image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            controller.totalCartItems().toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
        )
      ],
    );
  }
}
