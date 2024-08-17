import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/space_exs.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_colors.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_str.dart';
import 'package:task_managament_app_with_flutter_hive/utils/constants.dart';
import 'package:task_managament_app_with_flutter_hive/views/home/components/fab.dart';
import 'package:task_managament_app_with_flutter_hive/views/home/widget/task_widget.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<int> testing = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,

      /// FAB
      floatingActionButton: const Fab(),

      /// Body
      body: _buildHomeBody(textTheme),
    );
  }

/// Home Body
  Widget _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          /// Custom App Bar
          Container(
              margin: const EdgeInsets.only(top: 60),
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Progress Indicator
                  const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                          value: 1 / 3,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation(AppColors.primaryColor))),

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
              indent: 100,
            ),
          ),

          /// Tasks
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: 745,
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
                        width: 200,
                        height: 200,
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
