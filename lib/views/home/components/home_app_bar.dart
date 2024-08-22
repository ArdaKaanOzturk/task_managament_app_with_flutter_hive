import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:task_managament_app_with_flutter_hive/extensions/responsive_sizes.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.drawerKey});

  final GlobalKey<SliderDrawerState> drawerKey;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with SingleTickerProviderStateMixin{
  late AnimationController animateController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animateController = AnimationController(vsync: this, duration: const Duration(seconds: 1)
    );
    super.initState();
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }

  ///onToggle
  void onDrawerToggle(){
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if(isDrawerOpen){
        animateController.forward();
        widget.drawerKey.currentState!.openSlider();
      }else{
        animateController.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    final screenHeight = getScreenHeight(context);
    final iconSize = getIconSize(context, 30);

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.16,
      child:Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// Menu Icon
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: onDrawerToggle,
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close, 
                progress: animateController,
                size: iconSize
                )
              ),
            ),
            
            /// Trash Icon
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: (){
                  /// TODO: WE WILL REMOVE ALL THE TASKS FROM DB WITH THIS BUTTON ONPRESSED ACTIVITY
                },
              icon: Icon(
                CupertinoIcons.trash_fill,
                size: iconSize,
                )
              ),
            )
          ],
        ),
      )
    );
  }
}