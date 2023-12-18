import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Core/Utils/Navigater.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/widget/Containe_Home.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/widget/ContainerModel.dart';
import 'package:sera/Features/auth/presentaion/view/login_screen.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/MessageWidget/showMyDialog.dart';

class HomeVisitorScreen extends StatelessWidget {
  const HomeVisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight * .40, //70 for bottom
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.40,
                        decoration: const BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                        ),
                        child: Image.asset(
                          AssetsManager.background,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * .05,
                      left: 14,
                      child: Row(
                        children: [
                          SizedBox(
                              height:
                                  MediaQueryHelper.sizeFromHeight(context, 13),
                              child: InkWell(
                                  onTap: () {
                                    navigateTo(context, LoginScreen());
                                  },
                                  child: Icon(
                                    Iconsax.logout,
                                    color: AppColors.white,
                                    size: 30,
                                  ))),
                        ],
                      ),
                    ),
                    Positioned(
                        top: constraints.maxHeight * .12,
                        // height: MediaQueryHelper.sizeFromHeight(context, 6),
                        left: 10,
                        right: 10,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hello ,",
                              style: AppTextStyles.w800
                                  .copyWith(color: AppColors.white,fontSize: 33),
                            ),
                            Text(
                              "Welcome to Sera",
                              style: AppTextStyles.lrTitles
                                  .copyWith(color: AppColors.white,fontSize: 33),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All organizations",
                      style:
                          AppTextStyles.bold.copyWith(fontSize: 22, height: 0),

                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        containerModel.length,
                            (index) =>
                                ContainerHomeFeatures(
                              image: containerModel[index].image,
                              title: containerModel[index].title,

                              ontap: () {
                                navigateTo(
                                    context, containerModel[index].ontap);
                              }, color:  containerModel[index].color,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
