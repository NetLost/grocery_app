import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/features/home_screen/components/cart_details_view_card.dart';
import 'package:grocery_app/features/home_screen/controllers/home_screen_controller.dart';

class CartDetailView extends StatelessWidget {
  const CartDetailView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cart',
            style: Theme.of(context).textTheme.headline6,
          ),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailViewCard(
              productItem: controller.cart[index],
            ),
          ),
          const SizedBox(
            height: AppConstant.defaultPadding,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Next - \$30'),
            ),
          ),
        ],
      ),
    );
  }
}
