import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../../Core/Utils/Responsive.dart';
import '../../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../../Core/Utils/Widgets/TextFieldTemplate/CustomInputDecorator.dart';

class BottomSheetEditableInput extends StatelessWidget {
  final String name;
  final String title;
  final String label;
  final VoidCallback onTap;
  final String? value;
  final IconData? leadingIcon;

  const BottomSheetEditableInput({
    super.key,
    required this.name,
    required this.label,
    required this.onTap,
    this.value,
    this.leadingIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.w300.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          FormBuilderField(
            name: name,
            builder: (field) {
              return CustomInputDecorator(
                padding: value == null
                    ? const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      )
                    : const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                onTap: onTap,
                leadingIcon: leadingIcon,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (value == null)
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 14,
                        ),
                      )
                    else ...[
                      Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value!,
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
                trailing: const Icon(
                  Iconsax.edit_2,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class WalletLimitModalSheet extends StatefulWidget {
  final String title;
  final Function(double value) onSave;
  final double? initialValue;
  final bool isLoading;
  final TextInputType textInputType;

  const WalletLimitModalSheet({
    super.key,
    required this.title,
    required this.onSave,
    this.initialValue,
    this.isLoading = false, required this.textInputType,
  });

  Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => this,
    );
  }

  @override
  State<WalletLimitModalSheet> createState() => _WalletLimitModalSheetState();
}

class _WalletLimitModalSheetState extends State<WalletLimitModalSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 24,
      ).add(
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: AppColors.white),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title,
                style: AppTextStyles.bold.copyWith(fontSize: 16)),
            const SizedBox(height: 16),
            TextFieldTemplate(
              initialValue: widget.initialValue?.toString(),
              name: 'value',
              label: widget.title,
              inputType: widget.textInputType,
              leadingIcon: Iconsax.money,
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.numeric(),
              // ]),
            ),
            const SizedBox(height: 24),
            ButtonTemplate(
              width: MediaQueryHelper.sizeFromWidth(context, 1),
              isLoading: widget.isLoading,
              colorText: AppColors.white,
              text1: 'Save',
              onPressed: _save,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void _save() {
    final formState = _formKey.currentState;
    if (formState == null) return;

    if (formState.saveAndValidate() == false) return;

    widget.onSave(double.parse(formState.value['value']));
  }
}
