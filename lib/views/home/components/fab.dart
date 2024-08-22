import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/responsive_sizes.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_colors.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    final screenHeight = getScreenHeight(context);

    return GestureDetector(
      onTap: (){
        // we will navigate to Task view by tapping on this button
        log("Task View");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 10,
          child: Container(
            width: screenWidth * 0.18,
            height: screenHeight * 0.085,
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
      ),
    );
  }
}