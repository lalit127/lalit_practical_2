import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/controller/time_controller.dart';
import 'package:lalit_practical/utils/constants.dart';
import 'package:lalit_practical/widget/common_button.dart';
import 'package:lalit_practical/widget/common_dialog.dart';
import 'package:lalit_practical/widget/common_text.dart';
import 'package:lalit_practical/widget/common_text_field.dart';
import 'package:lalit_practical/widget/common_time_widget.dart';
import 'package:lalit_practical/widget/floating_widget.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final timeCon = Get.put<TimeController>(TimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          title: const CommonText(
            text: "TIMERS",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23.0),
          child: Obx(
            () => ListView.separated(
              itemCount: timeCon.timerList.value.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) => CommonTimeWidget(
                  onTap: () {
                timeCon.deleteSetTimer(timeCon.timerList.value[index]);
              }),
            ),
          ),
        ),
        floatingActionButton: FloatingWidget(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => CommonDialog());
          },
        ));
  }

}
