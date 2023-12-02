import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/controller/time_controller.dart';
import 'package:lalit_practical/utils/constants.dart';
import 'package:lalit_practical/widget/common_text.dart';

class CommonTimeWidget extends StatefulWidget {
  String? timeDuration;
  void Function()? onTap;

  CommonTimeWidget({super.key, this.timeDuration, this.onTap});

  @override
  State<CommonTimeWidget> createState() => _CommonTimeWidgetState();
}

class _CommonTimeWidgetState extends State<CommonTimeWidget> {
  final timeCon = Get.find<TimeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
              height: 121,
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Obx(
                      () => CommonText(
                        text:
                            "${timeCon.hourController.text}:${timeCon.minController.text}:${timeCon.secController.text}" ??
                                "10",
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppIcon.cancelIcon),
                      ),
                    ),
                  ),
                  SizedBox(width: 10)
                ],
              )),
        ),
      ],
    );
  }
}
