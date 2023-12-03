import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeController extends GetxController{

  RxInt count = 0.obs;
  RxList timerList = [].obs;
  RxInt totalStopTime= 0.obs;
  // Obtain shared preferences.

  TextEditingController hourController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController secController = TextEditingController();

  RxBool timeError = false.obs;

  resetValue(){
    hourController.text = "";
    minController.text = "";
    secController.text = "";
  }



  setTimer(){
    try{
      if(hourController.text.isEmpty && minController.text.isEmpty && secController.text.isEmpty){
        timeError.value = true;
      }
      else{
        timeError.value = false;
        timeDuration();
      }
    }catch(e){
      print(e);
    }
  }

  timeDuration() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    totalStopTime.value = (int.parse(hourController.text) * 3600) +
        (int.parse(minController.text) * 60) +
        int.parse(secController.text);
    if(totalStopTime.value == 0){
      timeError.value = true;
      resetValue();
      update();
    }
    else{
      timeError.value = false;
      timerList.add(totalStopTime.value);
      prefs.setStringList("timerList", timerList.value.map((e) => e.toString()).toList());
      print(prefs.getStringList("timerList"));
      Get.back();
      resetValue();
    }
  }

 deleteTimer(int index) async{
    timerList.removeAt(index);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("timerList", timerList.value.map((e) => e.toString()).toList());
  }
}