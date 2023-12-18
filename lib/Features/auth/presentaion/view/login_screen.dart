import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sera/Features/Visitor/home/presentaion/view/HomevisitorScreen.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Assets Manager.dart';
import '../../../../../Core/Utils/Navigater.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';
import '../../../Admin/home/presentaion/view/HomeScreen.dart';
import 'Register_Screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: MediaQueryHelper.sizeFromHeight(context, 15.5),
                right: -35,
                child: Hero(
                  tag: "Circle1",
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 30,
                  ),
                ),
              ),
              Positioned(
                top: MediaQueryHelper.sizeFromHeight(context, 3.5),
                left: -40,
                child: Hero(
                  tag: "Circle2",
                  child: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 35,
                  ),
                ),
              ),
              FormBuilder(
                // key: loginCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          24, 10 + MediaQuery.of(context).padding.top, 24, 15),
                      child: Column(
                        children: [
                          Hero(
                            tag: "logo",
                            child: Image.asset(
                              AssetsManager.logoPrimerColor,
                              width: 180,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Sign in to your account',
                              style: AppTextStyles.bold.copyWith(fontSize: 24)),
                          SizedBox(height: 8),
                          Text('Welcome back! Enter your information',
                              style: AppTextStyles.w600.copyWith(
                                  color: AppColors.darkGrey, fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          TextFieldTemplate(
                            name: 'username',
                            label: 'Enter your email',
                            leadingIcon: Icons.mail_outline,
                            boolleadingIcon: true,
                            leadingIconColor: AppColors.greenYellow,
                            enableFocusBorder: false,
                            title: "Email",
                            // validator: FormBuilderValidators.compose([
                            //   FormBuilderValidators.required(),
                            // ]),
                          ),
                          const SizedBox(height: 16),
                          TextFieldTemplate(
                            title: "Password",
                            name: 'password',
                            label: 'Password',
                            // leadingIcon: Iconsax.lock_1,
                            inputType: TextInputType.visiblePassword,
                            leadingIconColor: AppColors.greenYellow,
                            enableFocusBorder: false,
                            // validator: FormBuilderValidators.compose([
                            //   FormBuilderValidators.required(),
                            // ]),
                          ),
                          const SizedBox(height: 30),
                          ButtonTemplate(
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            colorText: AppColors.white,
                            color: AppColors.primaryColor,
                            text1: 'Login',
                            onPressed: () {
                              navigateTo(context, HomeScreen());
                            },
                          ),
                          const SizedBox(height: 15),
                          Row(children: <Widget>[
                            const Expanded(child: Divider()),
                            Text(
                              "OR",
                              style: AppTextStyles.w300.copyWith(fontSize: 18),
                            ),
                            const Expanded(child: Divider()),
                          ]),
                          const SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 2),
                            ),
                            child: ButtonTemplate(
                              width: MediaQueryHelper.sizeFromWidth(context, 1),
                              colorText: AppColors.primaryColor,
                              color: AppColors.backgroundColor,
                              text1: 'Log in as guest',
                              onPressed: () {
                                navigateAndFinished(context, const HomeVisitorScreen());
                              },
                            ),
                          ),
                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ",
                                  style: AppTextStyles.w300
                                      .copyWith(fontSize: 18)),
                              InkWell(
                                  onTap: () {
                                    navigateTo(context, RegisterScreen());
                                  },
                                  child: Text(' Sign up',
                                      style: AppTextStyles.bold.copyWith(
                                          color: AppColors.primaryColor,
                                          fontSize: 18))),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
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
