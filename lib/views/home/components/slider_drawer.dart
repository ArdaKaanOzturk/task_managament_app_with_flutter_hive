import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/responsive_sizes.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/space_exs.dart';
import 'package:task_managament_app_with_flutter_hive/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  /// Icons
  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  /// Texts
  final List<String> texts = [
    "Home",
    "Profile",
    "Settings",
    "Details",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    final screenHeight = getScreenHeight(context);
    final iconSize = getIconSize(context, 28);
    
    var textTheme = Theme.of(context).textTheme;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 90),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://instagram.fist1-1.fna.fbcdn.net/v/t51.2885-19/440974041_1147249559645153_6126284079505372062_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fist1-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=lpFlVs9vS2kQ7kNvgFlVE_S&edm=APHcPcMBAAAA&ccb=7-5&oh=00_AYB0HYacCYwWUURwDwmQhC4W1onNMhD4PaAx5K9yQd7lrw&oe=66CD0D66&_nc_sid=bef7bc"
                ),
                ),
                8.h,
                Text("Arda Kaan Ozturk", style: textTheme.displayMedium),
                Text("Flutter Dev", style: textTheme.displaySmall),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  width: double.infinity,
                  height: screenHeight * 0.4,
                  child: ListView.builder(
                    itemCount: icons.length,
                    itemBuilder: (BuildContext context, int index){
                      return InkWell(
                        onTap: (){
                          log('${texts[index]} Item Tapped!');
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          child: ListTile(
                            leading: Icon(
                              icons[index],
                              color: Colors.white,
                              size: iconSize,
                              ),
                            title: Text(
                              texts[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
          ],
        )
        );
  }
}
