import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Core/Utils/Navigater.dart';
import 'package:sera/Features/Organization/Profile/presentaion/view/widget/ContainerModel.dart';
import 'package:sera/Features/Organization/Profile/presentaion/view/widget/ContinerProfile.dart';
import 'package:sera/Features/Organization/Profile/presentaion/view/widget/category_box.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/widget/Containe_Home.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/widget/ContainerModel.dart';
import 'package:sera/Features/auth/presentaion/view/login_screen.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/MessageWidget/showMyDialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const Center(
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: NetworkImage(
                        'https://www.za.kayak.com/rimg/himg/98/36/2b/expediav2-4927-209e51-868852.jpg?width=2160&height=1215&crop=true&outputtype=webp'),
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: profilList.length,
                  separatorBuilder: (context, notificationIndex) {
                    return const Divider(
                      height: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTileProfile(
                      color: AppColors.primaryColor,
                      title: profilList[index].title,
                      icon: profilList[index].icon,
                      ontap: () {
                        navigateTo(context, profilList[index].ontap);
                      },
                    );
                  },
                ),
                const Divider(
                  height: 20,
                ),
                ListTileProfile(
                  color: AppColors.red,
                  colorarrow: AppColors.red,
                  title: 'Log out',
                  icon: Iconsax.logout,
                  ontap: () {
                    showMyDialog(
                        context: context,
                        ontap: () {
                          navigateAndFinished(context, LoginScreen());
                        },
                        message: "log out");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
