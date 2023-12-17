import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Core/Utils/Navigater.dart';
import 'package:sera/Features/Admin/Reports/presentaion/view/ReportsScreen.dart';
import 'package:sera/Features/Admin/home/presentaion/view/widget/HomeContinar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Features/auth/presentaion/view/login_screen.dart';
import '../../../../../Core/Utils/Widgets/MessageWidget/showMyDialog.dart';
import '../../../Complaints/presentaion/view/ComplaintsScreen.dart';
import '../../../Ratings/presentaion/view/RatingsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
                onTap: () {
                  showMyDialog(
                      context: context,

                      ontap: () {
                        navigateAndFinished(context, LoginScreen());
                      },
                      message: "log out");
                },
                child: Icon(Icons.output_sharp)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            children: [
              HomeContainer(
                titel: "Reports",
                icon: Iconsax.presention_chart,
                ontap: () {
                  navigateTo(context, ReportsScreen());
                },
              ),
              HomeContainer(
                titel: "Complaints and responses",
                icon: Iconsax.messages,
                ontap: () {
                  navigateTo(context, ComplaintsScreen());
                },
              ),
              HomeContainer(
                titel: "User ratings and comments",
                icon: Iconsax.sms_star,
                ontap: () {
                  navigateTo(context, RatingsScreen());
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
