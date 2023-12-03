import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_practical/controller/time_controller.dart';
import 'package:lalit_practical/utils/constants.dart';
import 'package:lalit_practical/widget/common_dialog.dart';
import 'package:lalit_practical/widget/common_text.dart';
import 'package:lalit_practical/widget/common_time_widget.dart';
import 'package:lalit_practical/widget/floating_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final timeCon = Get.put<TimeController>(TimeController());

  Future<void> _initializeTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final tempList = prefs.getStringList("timerList");
    timeCon.timerList.value = tempList?.map((e) => int.parse(e)).toList()??[];
  }

  @override
  initState() {
    super.initState();
    _initializeTimer();
  }


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
            () => (timeCon.timerList.value == null && timeCon.timerList.value.isEmpty)?SizedBox():ListView.separated(
              itemCount: timeCon.timerList.value.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) =>
                 Obx(() =>
                    CommonTimeWidget(
                    index:index,
                    timeDuration: timeCon.timerList.value[index].toString(),
                      onTap: () =>
                      timeCon.deleteTimer(index)
                      ),
            ),
          ),
        ),
        ),
        floatingActionButton: FloatingWidget(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => CommonDialog()).whenComplete((){
              timeCon.timeError.value = false;
                  timeCon.resetValue();
            });
          },
        ));
  }

}
