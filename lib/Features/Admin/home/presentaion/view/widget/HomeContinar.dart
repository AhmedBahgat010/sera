import 'package:flutter/material.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../../Core/Utils/Responsive.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.titel, required this.icon, this.ontap}) : super(key: key);
final String titel;
final IconData icon;
final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return               Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: MediaQueryHelper.sizeFromHeight(context, 5),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: ontap,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
           Icon(
           icon,
            size: 80,
            color: AppColors.white,
          ),
          Text(titel, style: AppTextStyles.w600.copyWith(color: AppColors.white))
        ]),
      ),
    );
  }
}
