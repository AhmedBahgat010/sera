import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/Widgets/datetime_extension/datetime_extension.dart';
import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../../Core/Utils/Assets Manager.dart';

class LeaveRequestCard extends StatelessWidget {
  final int state;
  final String childName;
  final DateTime dateType;
  final String type;
  final DateTime dateTime;
  final bool payIsLoading;
  final bool rejectIsLoading;

  const LeaveRequestCard({
    super.key,
    required this.state,
    required this.childName,
    required this.dateType,
    required this.type,
    required this.dateTime,
    required this.payIsLoading,
    required this.rejectIsLoading,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Fix the yellow green line at the right to match the UI
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: state == 0
                  ? AppColors.darkGrey
                  : state == 1
                      ? AppColors.greenYellow
                      : AppColors.red,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mediumGrey.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(

                        borderRadius: BorderRadius.circular(50.0),

                        child: Image.asset(
                          AssetsManager.logoPrimerColor,
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(childName,
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.primaryColor, fontSize: 18)),
                          Text(type,
                              style: AppTextStyles.lrTitles
                                  .copyWith(fontSize: 20)),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "From ",
                                  style: AppTextStyles.lrTitles.copyWith(
                                      color: AppColors.red, fontSize: 12),
                                ),
                                TextSpan(
                                  text: dateTime.formattedDate(context),
                                  style: AppTextStyles.lrTitles.copyWith(
                                      color: AppColors.red, fontSize: 12),
                                ),
                                TextSpan(
                                  text: "  To  ",
                                  style: AppTextStyles.lrTitles.copyWith(
                                      color: AppColors.red, fontSize: 12),
                                ),
                                TextSpan(
                                  text: dateType.formattedDate(context),
                                  style: AppTextStyles.lrTitles.copyWith(
                                      color: AppColors.red, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
