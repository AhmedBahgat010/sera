import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sera/Features/Admin/Reports/presentaion/view/widget/Indicator.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../../Core/Utils/Responsive.dart';

class ContainerReport extends StatefulWidget {
  const ContainerReport({Key? key}) : super(key: key);

  @override
  State<ContainerReport> createState() => _ContainerReportState();
}

class _ContainerReportState extends State<ContainerReport> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: MediaQueryHelper.sizeFromHeight(context, 2),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {},
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Innocent Drinks",
            style: AppTextStyles.bold,
          ),
          Text(
            "The design of Innocent Drinks' company profile reflects the simplicity of its drinks' ingredients. The profile includes the company's story, values and mission.",
            maxLines: 3,
            style: AppTextStyles.w300.copyWith(
                color: AppColors.mediumGrey,
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
                height: 1.2),
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 45,
                        sections: showingSections(),
                      ),
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: AppColors.primaryColor,
                      text: 'Waiting time',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Indicator(
                      color: AppColors.brightOrange,
                      text: 'Visiting time',
                      isSquare: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.primaryColor,
            value: 70,
            title: '70%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.brightOrange,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
