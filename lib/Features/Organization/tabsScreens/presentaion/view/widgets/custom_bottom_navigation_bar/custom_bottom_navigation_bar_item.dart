import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/App%20Textstyle.dart';

import '../../../../../../../Core/Utils/App Colors.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData coloredIcon;
  final bool selected;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.coloredIcon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selected)
            Stack(
              children: [
                Icon(
                  size: 30,
                  coloredIcon,
                  color: AppColors.white,
                ),
                Icon(
                  icon,
                  size: 30,
                ),
              ],
            )
          else
            Icon(
              icon,
              size: 30,
              color: AppColors.darkGrey.withOpacity(0.5),
            ),
          const SizedBox(height: 4),
          Text(label,
              style: AppTextStyles.w600.copyWith(
                color: selected
                    ? AppColors.primaryColor
                    : AppColors.darkGrey.withOpacity(0.45),
              )),
        ],
      ),
    );
  }
}
