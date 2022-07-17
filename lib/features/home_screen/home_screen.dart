import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/features/detail_screen/detail_screen.dart';
import 'package:grocery_app/features/home_screen/components/home_header.dart';
import 'package:grocery_app/features/home_screen/components/product_card.dart';
import 'package:grocery_app/features/home_screen/controllers/home_screen_controller.dart';
import 'package:grocery_app/features/home_screen/models/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = HomeScreenController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: AppConstant.panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? AppConstant.headerHeight
                            : -(constraints.maxHeight -
                                AppConstant.cartBarHeight * 2 -
                                AppConstant.headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            AppConstant.headerHeight -
                            AppConstant.cartBarHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstant.defaultPadding,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  AppConstant.defaultPadding * 1.5),
                              bottomRight: Radius.circular(
                                  AppConstant.defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: productsList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: AppConstant.defaultPadding,
                              crossAxisSpacing: AppConstant.defaultPadding,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product: productsList[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        FadeTransition(
                                      opacity: animation,
                                      child: DetailScreen(
                                        product: productsList[index],
                                        onProductAdd: () {
                                          controller.addProductToCart(
                                              productsList[index]);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      // Card Panel
                      AnimatedPositioned(
                        duration: AppConstant.panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? AppConstant.cartBarHeight
                            : (constraints.maxHeight -
                                AppConstant.cartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          // child: Container(
                          //   padding: const EdgeInsets.all(AppConstant.defaultPadding),
                          //   color: Color(0xFFEAEAEA),
                          //   alignment: Alignment.topLeft,
                          //   child: AnimatedSwitcher(
                          //     duration: panelTransition,
                          //     child: controller.homeState == HomeState.normal
                          //         ? CardShortView(controller: controller)
                          //         : CartDetailsView(controller: controller),
                          //   ),
                          // ),
                        ),
                      ),
                      // Header
                      AnimatedPositioned(
                        duration: AppConstant.panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -AppConstant.headerHeight,
                        right: 0,
                        left: 0,
                        height: AppConstant.headerHeight,
                        child: const HomeHeader(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
