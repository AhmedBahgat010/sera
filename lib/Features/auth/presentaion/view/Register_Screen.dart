
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Assets Manager.dart';
import '../../../../../Core/Utils/Navigater.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';
import 'login_screen.dart';
enum Places { owner, customer }

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const routeName = '/login';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Places? _character = Places.owner;

  String type = "user";

  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: MediaQueryHelper.sizeFromHeight(context, 15.5),
                right: -35,
                child: const Hero(
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
                child: const Hero(
                  tag: "Circle2",
                  child: CircleAvatar(
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
                          24,
                          10 + MediaQuery.of(context).padding.top,
                          24,
                          15),
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
                          Text('Sign Up to continue',
                              style: AppTextStyles.bold
                                  .copyWith(fontSize: 24)),
                          SizedBox(height: 8),
                          Text('Create an account to continue',
                              style: AppTextStyles.w600.copyWith(
                                  color: AppColors.darkGrey,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          TextFieldTemplate(

                            name: 'Full Name',
                            label: 'Enter your Full Name',
                            leadingIcon: Icons.person_2_outlined,
                            boolleadingIcon: true,
                            leadingIconColor: AppColors.greenYellow,
                            enableFocusBorder: false,
                            title: "Full Name",
                            // validator: FormBuilderValidators.compose([
                            //   FormBuilderValidators.required(),
                            // ]),
                          ),
                          const SizedBox(height: 16),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Radio<Places>(
                                    activeColor: AppColors.primaryColor,
                                    value: Places.customer,
                                    groupValue: _character,
                                    onChanged: (Places? value) {
                                      setState(() {
                                        _character = value;
                                        type = "owner";
                                      });
                                    },
                                  ),
                                  Text('Owner',
                                      style: AppTextStyles.w800.copyWith(
                                          color: AppColors.primaryColor, fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<Places>(
                                    activeColor: AppColors.primaryColor,
                                    value: Places.owner,
                                    groupValue: _character,
                                    onChanged: (Places? value) {
                                      setState(() {
                                        _character = value;
                                        type = "Customer";
                                      });
                                    },
                                  ),
                                  Text('Customer',
                                      style: AppTextStyles.w800.copyWith(
                                          color: AppColors.primaryColor, fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ButtonTemplate(
                            width: MediaQueryHelper.sizeFromWidth(
                                context, 1),
                            colorText: AppColors.white,
                            color: AppColors.primaryColor,
                            text1: 'Sign Up',
                            onPressed:(){

                            },

                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",
                                  style: AppTextStyles.w300.copyWith(
                                      fontSize: 18)),
                              InkWell(
                                  onTap: () {
                                    navigateTo(context, LoginScreen());
                                  },
                                  child: Text('Sign in',
                                      style: AppTextStyles.bold.copyWith(
                                          color: AppColors.primaryColor,fontSize: 18))),
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
