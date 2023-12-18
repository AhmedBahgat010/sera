import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Core/Utils/App%20Textstyle.dart';
import 'package:sera/Core/Utils/Responsive.dart';

class ContainerHomeFeatures extends StatefulWidget {
  final String image;
  final String title;
  final Color color;
  final Function()? ontap;

  const ContainerHomeFeatures(
      {Key? key,
      required this.image,
      required this.title,
      required this.ontap, required this.color})
      : super(key: key);

  @override
  State<ContainerHomeFeatures> createState() => _ContainerHomeFeaturesState();
}

class _ContainerHomeFeaturesState extends State<ContainerHomeFeatures> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

        width: MediaQueryHelper.sizeFromWidth(context, 2),
        height: MediaQueryHelper.sizeFromHeight(context, 3),
        decoration: BoxDecoration(
            color: widget.color.withOpacity(.8), borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              widget.image,
              color: AppColors.white,
              height: 80,
            ),
            Text(
              widget.title,
              style: AppTextStyles.w300.copyWith(color: AppColors.white,fontSize: 26),
            ),

          ],
        ),
      ),
    );
  }
}
