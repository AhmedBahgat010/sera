import 'package:flutter/material.dart';
import 'package:sera/Features/auth/presentaion/view/login_screen.dart';

import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Navigater.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../Core/Utils/Widgets/MessageWidget/showMyDialog.dart';

class OrganizationDetailsScreen extends StatelessWidget {
  const OrganizationDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stem rust",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: ListView(
          children: [
            Hero(
              tag: 'heroimage',

              child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                padding: EdgeInsets.only(bottom: 5),

                child: Image.network(
                  "https://www.coffeebeancompany.co.uk/app/uploads/2017/04/Coffee-Shop-570x426.jpg",
                  fit: BoxFit.cover,
                  width: MediaQueryHelper.sizeFromWidth(context, 1),
                ),
              ),
            ),
            Text(
              "an establishment that primarily serves various types of coffee, espresso, latte, and cappuccino. Some coffeehouses may serve cold drinks, such as iced coffee and iced tea",
              style: AppTextStyles.lrTitles.copyWith(fontSize: 16),
            ),
            Divider(height: 20, color: Colors.black),

            ButtonTemplate(
                color: AppColors.primaryColor,
                text1: 'Book Now',
                colorText: AppColors.white,
                onPressed: () {
                  showMyDialog(
                      message: "Log in to book",
                      context: context,
                      ontap: () {
                        navigateAndFinished(context, LoginScreen());
                      });
                }),
          ],
        ),
      ),
    );
  }
}
