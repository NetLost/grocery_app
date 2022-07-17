import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/core/ui/components/fav_btn.dart';
import 'package:grocery_app/core/ui/components/price.dart';
import 'package:grocery_app/features/home_screen/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.press,
    Key? key,
  }) : super(key: key);

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConstant.defaultPadding),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstant.defaultPadding * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.title,
              child: Image.asset(product.image!),
            ),
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Vegetables',
              style: Theme.of(context).textTheme.caption,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Price(amount: '20.00'),
                FavBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
