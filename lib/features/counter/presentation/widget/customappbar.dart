import 'package:bloc_counter_with_hive/common/appcolors.dart';
import 'package:bloc_counter_with_hive/common/apptextStyle.dart';
import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  CAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.Appbarcolor,
      title: Text(
        text,
        style: AppText.AppbarText,
      ),
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
