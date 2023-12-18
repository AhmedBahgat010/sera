import 'dart:ui';

import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Features/Visitor/organizations/presentaion/view/organizationsScreen.dart';


import '../../../../../../Core/Utils/Assets Manager.dart';

class ContainerModel {
  final String image;
  final String title;
  final Color color;
  final ontap;

  ContainerModel( {
    required this.title,
    required this.ontap,required this.color,
    required this.image,
  });
}

List<ContainerModel> containerModel = [
  ContainerModel(
    ontap: OrganizationsScreen(apparText: 'Coffee'),
color: AppColors.logoColorYellow,
    image: AssetsManager.coffee,
    title: 'Coffee',
  ),
  ContainerModel(
    ontap: OrganizationsScreen(apparText:"Hotel" ),
    image: AssetsManager.hotel,
    color: AppColors.brightOrange,

    title: 'Hotel',
  ),
  ContainerModel(
    ontap: OrganizationsScreen(apparText:"Restaurant" ),
    image: AssetsManager.restaurant,
    color: AppColors.logoColorPurple,

    title: 'Restaurant',
  ),
  ContainerModel(
    ontap: OrganizationsScreen(apparText:'Barbershop' ),
    image: AssetsManager.barbershop,
    color: AppColors.logoColorGreen,

    title: 'Barbershop',
  ),
];
