import 'package:flutter/widgets.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getIconSize(BuildContext context, double size) {
  final screenWidth = MediaQuery.of(context).size.width;
  return size * (screenWidth / 375); // 375, referans alınan ekran genişliği
}