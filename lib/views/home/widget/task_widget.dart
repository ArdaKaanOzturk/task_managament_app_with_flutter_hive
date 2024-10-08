import 'package:flutter/material.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/responsive_sizes.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    final screenHeight = getScreenHeight(context);

    return GestureDetector(
      onTap: (){
        /// Navigate to Task View to see Task Details
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0, 4),
              blurRadius: 10,
            )
          ]
        ),
        duration: const Duration(milliseconds: 600),
        child: ListTile(
      
      
          /// Check Icon
          leading: GestureDetector(
            onTap: (){
              /// Check or unCheck the task
                },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: screenWidth * 0.001)
              ),
              child: const Icon(Icons.check,
                  color: Colors.white,
              ),
            ),
          ),
        
        /// Task Title
        title: const Padding(
          padding: EdgeInsets.only(bottom: 5, top: 3),
          child: Text("Done",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                // decoration: TextDecoration.lineThrough
              )
            ),
        ),
        
        /// Task Description
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Descriptions",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  // decoration: TextDecoration.lineThrough
                ),
            ),
      
            /// Date of Task
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Date",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )
                  ),
                  Text("SubDate",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )
                  ),
                ]
              ),
            ) 
          ]
        ),
        
        ),
      ),
    );
  }
}