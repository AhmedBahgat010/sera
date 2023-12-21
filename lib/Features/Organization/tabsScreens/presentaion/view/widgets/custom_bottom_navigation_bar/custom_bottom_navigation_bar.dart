import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/Responsive.dart';

import '../../../../../../../Core/Utils/App Colors.dart';
import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  final List<CustomBottomNavigationBarItem> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.sizeFromWidth(context, 2),
      margin: EdgeInsets.all(20),
      decoration:  BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 20,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int index = 0; index < items.length; index++)
            GestureDetector(
              onTap: () => onTap(index),
              child: items[index],
            ),
        ],
      ),
    );
  }
}
