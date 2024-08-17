import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_colors.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // we will navigate to Task view by tapping on this button
        log("Task View");
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15)
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            )
          )
        ),
      ),
    );
  }
}