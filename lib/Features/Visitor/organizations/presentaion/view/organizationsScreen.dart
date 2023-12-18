import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/Navigater.dart';
import 'package:sera/Features/Visitor/organizationDetails/presentaion/view/organizationDetailsScreen.dart';
import 'package:sera/Features/Visitor/organizations/presentaion/view/widget/ContainerOrganizations.dart';

class OrganizationsScreen extends StatelessWidget {
  final String apparText;

  const OrganizationsScreen({super.key, required this.apparText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(apparText),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => ContainerOrganizations(
                title: "Stem rust",
                description:
                    "an establishment that primarily serves various types of coffee, espresso, latte, and cappuccino. Some coffeehouses may serve cold drinks, such as iced coffee and iced tea",
                image:
                    "https://www.coffeebeancompany.co.uk/app/uploads/2017/04/Coffee-Shop-570x426.jpg",
                ontap: () {
                  navigateTo(context, OrganizationDetailsScreen());
                }),
          ),
        ));
  }
}
