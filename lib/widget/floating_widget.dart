import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalit_practical/utils/constants.dart';

class FloatingWidget extends StatelessWidget {
  void Function()? onPressed;

  FloatingWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColor.transparent,
        elevation: 0,
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: AppColor.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(AppIcon.addIcon),
          ),
        ));
  }
}
