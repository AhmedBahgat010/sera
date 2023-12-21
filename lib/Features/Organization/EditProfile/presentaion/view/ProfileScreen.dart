import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/Navigater.dart';
import 'package:sera/Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import 'package:sera/Features/Organization/EditProfile/presentaion/view/widget/BottomSheetEditableInput.dart';
import 'package:sera/Features/Organization/EditProfile/presentaion/view/widget/display_image_widget.dart';

import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late String _selectedItem = typeList.first;
  TimeOfDay _startTime = TimeOfDay(hour: 1, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 2, minute: 0);

  void _selectTime(bool isStartTime) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTime : _endTime,
    );

    if (newTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = newTime;
          print("Selected startTime: ${_startTime.format(context)}");
        } else {
          _endTime = newTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Column(
            children: [
              InkWell(
                  onTap: () {},
                  child: DisplayImage(
                    imagePath:
                        "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
                    onPressed: () {
                      WalletLimitModalSheet(
                        textInputType: TextInputType.datetime,
                        title: "title",
                        onSave: (value) {},
                      );
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              BottomSheetEditableInput(
                title: 'Name',
                name: "name",
                label: "coffee shop",
                onTap: () {
                  WalletLimitModalSheet(
                    textInputType: TextInputType.emailAddress,
                    title: "Name",
                    onSave: (value) {},
                  ).show(context);
                },
              ),
              BottomSheetEditableInput(
                title: 'Description',
                name: "description",
                label:
                    "an establishment that primarily serves various types of coffee, espresso, latte, and cappuccino",
                onTap: () {
                  WalletLimitModalSheet(
                    textInputType: TextInputType.emailAddress,
                    title: "Description",
                    onSave: (value) {},
                  ).show(context);
                },
              ),
              BottomSheetEditableInput(
                title: 'Type',
                name: "type",
                label: _selectedItem,
                onTap: () {
                  _openDropdownMenu(context);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQueryHelper.sizeFromWidth(context, 2.5),
                    child: BottomSheetEditableInput(
                      name: "startTime",
                      title: 'Start work',
                      label: _startTime.format(context),
                      onTap: () {
                        _selectTime(true);
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQueryHelper.sizeFromWidth(context, 2.5),
                    child: BottomSheetEditableInput(
                      name: "endTime",
                      title: 'End Time',
                      label: _endTime.format(context),
                      onTap: () {
                        _selectTime(false);
                      },
                    ),
                  ),
                ],
              ),
              BottomSheetEditableInput(
                title: 'Number of customers waiting',
                name: "NumberWaiting",
                label: "50",
                onTap: () {
                  WalletLimitModalSheet(
                    textInputType: TextInputType.number,
                    title: "Number of customers waiting",
                    onSave: (value) {
                      print("object");
                      Navigator.pop(context);
                    },
                  ).show(context);
                },
              ),
              BottomSheetEditableInput(
                title: 'Time Waiting',
                name: "TimeWaiting",
                label: " 10 min",
                onTap: () {
                  WalletLimitModalSheet(
                    textInputType: TextInputType.datetime,
                    title: "Time Waiting",
                    onSave: (value) {},
                  ).show(context);
                },
              ),
              ButtonTemplate(
                color: AppColors.primaryColor,
                text1: "Save",
                onPressed: () {},
                colorText: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openDropdownMenu(
    BuildContext context,
  ) async {
    final selectedItem = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 0.025 * MediaQueryHelper.sizeFromHeight(context, 1),
              ),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    height: 6,
                    width: 0.15 * MediaQueryHelper.sizeFromWidth(context, 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.mediumGrey),
                  ),
                  const Spacer(),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: typeList.map((name) {
                  return ListTile(
                    title: Text(name.toString()),
                    onTap: () {
                      Navigator.pop(context, name.toString());
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );

    if (selectedItem != null) {
      setState(() {
        _selectedItem = selectedItem;
      });
    }
  }
}

List<String> typeList = [
  "coffee shop",
  "Restaurant",
  "Hotel",
  "Hairdresser",
];
