import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';

import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [


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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManager.logoPrimerColor,
                            width: 180,
                          ),
                          SizedBox(height: 20),
                          Text('Add a reservation for the customer',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bold.copyWith(fontSize: 22)),
                          SizedBox(height: 8),
                          Text('Enter the customer email ',
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
                            label: 'Enter customer email ',
                            leadingIcon: Icons.mail_outline,
                            boolleadingIcon: true,
                            leadingIconColor: AppColors.greenYellow,
                            enableFocusBorder: false,
                            title: "customer email",
                            // validator: FormBuilderValidators.compose([
                            //   FormBuilderValidators.required(),
                            // ]),
                          ),

                          const SizedBox(height: 30),
                          ButtonTemplate(
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            colorText: AppColors.white,
                            color: AppColors.primaryColor,
                            text1: 'Booking',
                            onPressed: () {
                            },
                          ),



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
