import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/space_exs.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_colors.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_str.dart';
import 'package:task_managament_app_with_flutter_hive/utils/constants.dart';
import 'package:task_managament_app_with_flutter_hive/views/home/components/fab.dart';
import 'package:task_managament_app_with_flutter_hive/views/home/components/home_app_bar.dart';
import 'package:task_managament_app_with_flutter_hive/views/home/components/slider_drawer.dart';
import 'package:task_managament_app_with_flutter_hive/views/home/widget/task_widget.dart';
import 'package:animate_do/animate_do.dart';

import '../../extensions/responsive_sizes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
  
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  final List<int> testing = [];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    final screenWidth = getScreenWidth(context);
    final screenHeight = getScreenHeight(context);

    return Scaffold(
      backgroundColor: Colors.white,

      /// FAB
      floatingActionButton: const Fab(),

      /// Body
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 1000,
        /// Drawer
        slider: CustomDrawer(),

        appBar: HomeAppBar(
          drawerKey: drawerKey,
          ),

        /// Main Body
        child: _buildHomeBody(textTheme, screenHeight, screenWidth),
      ),
    );
  }

/// Home Body
  Widget _buildHomeBody(TextTheme textTheme, double screenHeight, double screenWidth) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          /// Custom App Bar
          Container(
              margin: const EdgeInsets.only(top: 60),
              height: screenHeight * 0.09,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Progress Indicator
                  SizedBox(
                      width: screenWidth * 0.075,
                      height: screenHeight * 0.038,
                      child: CircularProgressIndicator(
                          value: 1 / 3,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation(AppColors.primaryColor)
                          )
                          ),

                  /// Space
                  25.w,

                  /// Top Level Task Info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStr.mainTitle, style: textTheme.displayLarge),
                      3.h,
                      Text("1 of 3 task", style: textTheme.titleMedium),
                    ],
                  )
                ],
              )),

          /// Divider
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 90,
            ),
          ),

          /// Tasks
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.65,
                child: testing.isNotEmpty 
                
                /// Task list is not empty
                ? ListView.builder(
                  /*shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),*/
                  itemCount: testing.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.horizontal,
                      onDismissed: (_){
                        /// We will remove current task from DB
                      },
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.delete_outline,
                            color: Colors.grey
                          ),
                          8.w,
                          const Text(AppStr.deletedTask,
                          style: TextStyle(
                            color: Colors.grey
                          )
                          )
                        ]
                      ), 
                      key: Key(
                        index.toString()), 
                      child: const TaskWidget());
                  },
                ) 
                
                /// Task list is empty
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /// Lottie Animation
                    FadeIn(
                      child: SizedBox(
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.3,
                        child: Lottie.asset(
                          lottieURL, 
                          animate: testing.isNotEmpty ? false : true),
                      ),
                    ),
                    
                    /// sub Text
                    FadeInUp(
                      from: 30,
                      child: const Text(
                        AppStr.doneAllTask))
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
