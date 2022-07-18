import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/core/ui/components/price.dart';
import 'package:grocery_app/features/home_screen/models/product_item.dart';

class CartDetailViewCard extends StatelessWidget {
  const CartDetailViewCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppConstant.defaultPadding,
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product!.image!),
      ),
      title: Text(
        productItem.product!.title,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: '20'),
            Text(
              ' x ${productItem.quantity}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
