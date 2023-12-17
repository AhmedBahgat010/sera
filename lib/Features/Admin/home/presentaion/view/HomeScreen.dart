import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Core/Utils/App%20Textstyle.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Core/Utils/Navigater.dart';
import 'package:sera/Features/Admin/Reports/presentaion/view/ReportsScreen.dart';
import 'package:sera/Features/Admin/home/presentaion/view/widget/HomeContinar.dart';
import '../../../../../Core/Utils/Responsive.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sera"),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            AssetsManager.logoPrimerColor,
            width: 10,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.output_sharp),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            children: [
              HomeContainer(
                titel: "Reports",
                icon: Iconsax.presention_chart,
                ontap: () {
                  navigateTo(context, const ReportsScreen());
                },
              ),
              HomeContainer(
                titel: "Complaints and responses",
                icon: Iconsax.alarm4,
                ontap: () {},
              ),
              HomeContainer(
                titel: "User ratings and comments",
                icon: Iconsax.repeate_one1,
                ontap: () {},
              ),
            ],
          ),
        )),
      ),
    );
  }
}
