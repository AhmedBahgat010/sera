import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../../Core/Utils/Assets Manager.dart';
import '../../../../../../Core/Utils/Responsive.dart';
import '../../../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../../../../Core/Utils/Widgets/TextFieldTemplate/TextFieldTemplate.dart';

class ContainerComplaint extends StatefulWidget {
  const ContainerComplaint({super.key});

  @override
  State<ContainerComplaint> createState() => _ContainerComplaintState();
}

class _ContainerComplaintState extends State<ContainerComplaint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "From :  ",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primaryColor, fontSize: 19),
                  // style: AppTextStyles.w300.apply(
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Ahmed ",
                      style: AppTextStyles.bold.copyWith(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),

                      //  style: AppTextStyles.lrTitles
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "To :  ",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primaryColor, fontSize: 19),
                  // style: AppTextStyles.w300.apply(
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "ALBAIK ",
                      style: AppTextStyles.bold.copyWith(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),

                      //  style: AppTextStyles.lrTitles
                    ),
                  ],
                ),
              ),
              const Divider(height: 20, color: Colors.black),
              RichText(
                text: TextSpan(
                  text: "Message :  ",
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.primaryColor, fontSize: 19),
                  // style: AppTextStyles.w300.apply(
                  //   color: Colors.black,
                  // ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Does it contain items that are specific to the employee portions of the restaurant to the restaurant employees’ plate? Unfortunately, the level of Al-Baik Restaurants’ services is declining day after day in light of the absence of the main manager. I personally experienced several parking lots in different directions within the city of Jeddah that indicate this decline.” level of service and quality",
                      style: AppTextStyles.lrTitles.copyWith(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),

                      //  style: AppTextStyles.lrTitles
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTemplate(
            color: AppColors.primaryColor,
            text1: "To Reply",
            colorText: AppColors.white,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppColors.white,
                      title: Center(
                          child: Text(
                        'Respond to the complaint',
                        style: AppTextStyles.bold.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                        ),
                      )),
                      titleTextStyle:
                          AppTextStyles.bold.apply(color: AppColors.black),
                      //titlePadding: const EdgeInsets.symmetric(vertical: 20),
                      // elevation: 10,
                      insetPadding: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                              //color: AppColors.pink,
                              ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      content: SizedBox(
                        width: 100,
                        child: SingleChildScrollView(
                          child: TextFieldTemplate(
                            label: 'Respond to the complaint',
                            name: 'Respond to the complaint',
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        Center(
                          child: ButtonTemplate(
                            color: AppColors.primaryColor,
                            onPressed: () {
                              print(
                                  "ssssdddddddddddddddddddddddddddddddddddddddds");
                              // GetMyEventCubit.get(context)
                              //     .postAllComments(
                              //         title: controller.text,
                              //         doc: myComments[index].docuId);

                              Navigator.pop(context);
                              // .success(
                              //   description: Text("تم ارسال ردك"),
                              // ).show(context);
                            },
                            text1: 'Send',
                            colorText: AppColors.white,
                          ),
                        ),
                      ],
                    );
                  });
            },
            minheight: 50,
          ),
        ],
      ),
    );
  }
}
