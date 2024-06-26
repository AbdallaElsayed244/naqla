
import 'package:Naqla/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


void showMessage(
    BuildContext context,
    String description,
    void Function() OkFunction,
    void Function() CancelFunction,
    String title,
    String btnOkText,
    String btnCancelText,
    DialogType dialogType 
    
    ) {
  AwesomeDialog(
          context: context,
          keyboardAware: true,
          dismissOnBackKeyPress: false,
          dialogType:dialogType ,
          animType: AnimType.topSlide,
          dialogBackgroundColor: const Color.fromARGB(255, 232, 232, 233),
          btnCancelText: btnCancelText,
          btnOkText: btnOkText,
          title: title,
          desc: description,
          descTextStyle: const TextStyle(fontSize: 20),
          btnOkColor: ButtonsColor2,
          btnCancelColor: const Color.fromARGB(255, 70, 64, 57),
          btnCancelOnPress: CancelFunction,
          btnOkOnPress: OkFunction)
      .show();
}
