import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Core/Utils/App%20Textstyle.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Features/Admin/home/presentaion/view/widget/HomeContinar.dart';
import '../../../../../Core/Utils/Responsive.dart';
import 'package:iconsax/iconsax.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reports"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: MediaQueryHelper.sizeFromHeight(context, 5),
                width: MediaQueryHelper.sizeFromWidth(context, 1),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.access_alarm_outlined,
                          size: 80,
                          color: AppColors.white,
                        ),
                        Text("titel",
                            style: AppTextStyles.w600
                                .copyWith(color: AppColors.white))
                      ]),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
