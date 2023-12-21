import 'package:flutter/material.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../../Core/Utils/Responsive.dart';
class CategoryBox extends StatelessWidget {
  CategoryBox({required this.color, required this.imgPath,required this.txt, Key? key})
      : super(key: key);
  Color color;
  String imgPath;
  String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryHelper.sizeFromWidth(context, 6),
          width: MediaQueryHelper.sizeFromWidth(context, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Center(
            child: Image.asset(
              imgPath,
              width: MediaQueryHelper.sizeFromWidth(context, 14),
            ),
          ),
        ),
        Text(txt,style: AppTextStyles.bold.copyWith(fontSize: 16),)
      ],
    );
  }
}



class Containedata extends StatelessWidget {
  final Widget widget;
  final String text;
  final IconData icon;

  const Containedata(
      {Key? key, required this.widget, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: AppTextStyles.bold
                    .copyWith(fontSize: -3, color: AppColors.primaryColor),
              ),
            ],
          ),
          Directionality(textDirection: TextDirection.ltr, child: widget)
        ],
      ),
    );
  }
}
