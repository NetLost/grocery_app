import 'package:flutter/material.dart';
import 'package:grocery_app/core/contstant.dart';
import 'package:grocery_app/core/ui/color/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.headerHeight,
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.all(AppConstant.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning!',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                'Caesar Rincon',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black54),
              )
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              'assets/images/profile.png',
            ),
          )
        ],
      ),
    );
  }
}
