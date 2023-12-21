import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';

import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';
import '../../../EditProfile/presentaion/view/widget/BottomSheetEditableInput.dart';

class AddExtraTimeScreen extends StatelessWidget {
  const AddExtraTimeScreen({super.key});

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
                          Text('Add Extra Time',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bold.copyWith(fontSize: 22)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          BottomSheetEditableInput(
                            title: 'Add Extra Time',
                            name: "AddExtraTime",
                            label: " 10 min",
                            onTap: () {
                              WalletLimitModalSheet(
                                textInputType: TextInputType.datetime,
                                title: "Add Extra Time",
                                onSave: (value) {},
                              ).show(context);
                            },
                          ),
                          const SizedBox(height: 30),
                          ButtonTemplate(
                            width: MediaQueryHelper.sizeFromWidth(context, 1),
                            colorText: AppColors.white,
                            color: AppColors.primaryColor,
                            text1: 'Add ',
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
