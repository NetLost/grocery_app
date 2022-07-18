import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/core/ui/components/fav_btn.dart';
import 'package:grocery_app/core/ui/components/price.dart';
import 'package:grocery_app/features/detail_screen/components/cart_counter.dart';
import 'package:grocery_app/features/home_screen/models/product.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.product,
    required this.onProductAdd,
    Key? key,
  }) : super(key: key);

  final Product product;
  final VoidCallback onProductAdd;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _cartTag = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppConstant.defaultPadding,
              left: AppConstant.defaultPadding,
              bottom: AppConstant.defaultPadding,
            ),
            child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: const Text('Add to Cart'),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.37,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFF8F8F8),
                    child: Hero(
                      tag: widget.product.title + _cartTag,
                      child: Image.asset(widget.product.image!),
                    ),
                  ),
                  const Positioned(
                    bottom: -20,
                    child: CartCounter(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppConstant.defaultPadding * 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.defaultPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Price(amount: '20.00')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(AppConstant.defaultPadding),
              child: Text(
                'Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).',
                style: TextStyle(
                  color: Color(0xFFBDBDBD),
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Vegetables',
        style: TextStyle(color: Colors.black),
      ),
      actions: const [
        FavBtn(radius: 20),
        SizedBox(
          width: AppConstant.defaultPadding,
        )
      ],
    );
  }
}
