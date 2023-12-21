import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Features/Organization/AddCustomer/presentaion/view/AddCustomerScreen.dart';
import 'package:sera/Features/Organization/AddExtraTime/presentaion/view/AddExtraTime.dart';
import 'package:sera/Features/Organization/EditProfile/presentaion/view/ProfileScreen.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/HomevisitorScreen.dart';
import 'package:sera/Features/Visitor/organizations/presentaion/view/organizationsScreen.dart';

import '../../../../../../Core/Utils/Assets Manager.dart';

class profilModel {
  final String title;
  final IconData icon;
  final Widget ontap;

  profilModel({
    required this.title,
    required this.ontap,
    required this.icon,
  });
}

List<profilModel> profilList = [
  profilModel(
    ontap: EditProfileScreen(),
    icon: Iconsax.user_edit,
    title: 'Edit Information',
  ),
  profilModel(
    ontap: AddExtraTimeScreen (),
    icon: Iconsax.calendar_add,
    title: 'Extra delay time',
  ),
  profilModel(
    ontap: AddCustomerScreen(),
    icon: Iconsax.profile_add,
    title: 'Add a user booking',
  ),
];
