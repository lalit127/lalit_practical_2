import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/controller/time_controller.dart';
import 'package:lalit_practical/utils/constants.dart';
import 'package:lalit_practical/widget/common_text.dart';

class CommonTimeWidget extends StatefulWidget {
  String? timeDuration;
  void Function()? onTap;
  int? index;

  CommonTimeWidget({super.key, this.timeDuration, this.onTap,  this.index});

  @override
  State<CommonTimeWidget> createState() => _CommonTimeWidgetState();
}

class _CommonTimeWidgetState extends State<CommonTimeWidget> {
  final timeCon = Get.find<TimeController>();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }


  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeCon.timerList[widget.index!] > 0) {
        timeCon.timerList[widget.index!] = timeCon.timerList[widget.index!] - 1;
      } else {
        timeCon.timerList.removeAt(widget.index!);
        timer.cancel();
      }
      timeCon.update();
    });
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    int remainingSeconds = timeCon.timerList.value[widget.index!];
    final int hour = remainingSeconds ~/ 3600;
    final int minutes = (remainingSeconds % 3600) ~/ 60;
    final int seconds = remainingSeconds % 60;

   return CommonText(
        text: "${twoDigits(hour)}:${twoDigits(minutes)}:${twoDigits(seconds)}",
        fontSize: 40,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      );
    }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

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
                    child: buildTime()
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
