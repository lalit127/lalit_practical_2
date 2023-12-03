import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/controller/time_controller.dart';
import 'package:lalit_practical/utils/constants.dart';
import 'package:lalit_practical/widget/common_button.dart';
import 'package:lalit_practical/widget/common_text.dart';
import 'package:lalit_practical/widget/common_text_field.dart';

class CommonDialog extends StatelessWidget {
  CommonDialog({super.key});

  final timeCon = Get.find<TimeController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: AppColor.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: CommonText(
                  text: 'Add Timer',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 63),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CommonTextField(controller: timeCon.hourController),
                    const CommonText(
                      text: "Hours",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: CommonText(
                    text: ":",
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    color: AppColor.black.withOpacity(0.54),
                  ),
                ),
                Column(
                  children: [
                    CommonTextField(controller: timeCon.minController),
                    const CommonText(
                      text: "Minutes",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: CommonText(
                    text: ":",
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    color: AppColor.black.withOpacity(0.54),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonTextField(
                      controller: timeCon.secController,
                    ),
                    const CommonText(
                      text: "Sec",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 85,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 31.0),
              child: InkWell(
                onTap: () {
                  timeCon.setTimer();
                },
                child: CommonButton(
                  text: 'ADD',
                ),
              ),
            ),
            const SizedBox(height: 23)
          ],
        ),
      ),
    );
  }
}
