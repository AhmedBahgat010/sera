import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Core/Utils/Navigater.dart';

import 'package:sera/Features/auth/presentaion/view/login_screen.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/CustomTabBar/CustomTabBar.dart';
import '../../../Reservations/presentaion/view/widgets/DismissibleBackground.dart';
import '../../../Reservations/presentaion/view/widgets/leave_request.dart';

class HomeOrganizationScreen extends StatefulWidget {
  const HomeOrganizationScreen({super.key});

  @override
  State<HomeOrganizationScreen> createState() => _HomeOrganizationScreenState();
}

class _HomeOrganizationScreenState extends State<HomeOrganizationScreen> {
  int _currentTabIdx = 0;

  void _onTabChanged(int index) {
    if (index == _currentTabIdx) return;
    setState(() => _currentTabIdx = index);
  }

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
                        top: constraints.maxHeight * .12,
                        // height: MediaQueryHelper.sizeFromHeight(context, 6),
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hello Name Test,",
                              style: AppTextStyles.w800.copyWith(
                                  color: AppColors.white, fontSize: 33),
                            ),
                            Text(
                              "Welcome to Sera",
                              style: AppTextStyles.lrTitles.copyWith(
                                  color: AppColors.white, fontSize: 33),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, right: 15, left: 15, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Reservations",
                      style:
                          AppTextStyles.bold.copyWith(fontSize: 20, height: 0),
                    ),
                    CustomTabBar(
                      backgroundColor: AppColors.white,
                      disableShadow: true,
                      tabs: const [
                        "Class one",
                        "Class two",
                        "Class three",
                      ],
                      selectedIndex: _currentTabIdx,
                      onTabChanged: _onTabChanged,
                    ),



                    ListView.separated(
                      padding: const EdgeInsets.all(24),    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 24),
                      itemBuilder: (context, index) {




                        return LeaveRequestCard(
                          state: 0,
                          childName: "Test Name",
                          dateType: DateTime.now(),
                          type:"test@gmail.com",
                          dateTime: DateTime.now(),
                          payIsLoading: false,
                          rejectIsLoading: true,
                        );
                      },
                    )
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
