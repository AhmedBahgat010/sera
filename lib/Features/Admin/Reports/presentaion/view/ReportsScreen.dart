import 'package:flutter/material.dart';
import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Core/Utils/App%20Textstyle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sera/Core/Utils/Assets%20Manager.dart';
import 'package:sera/Features/Admin/Reports/presentaion/view/widget/Indicator.dart';
import 'package:sera/Features/Admin/home/presentaion/view/widget/HomeContinar.dart';
import '../../../../../Core/Utils/Responsive.dart';
import 'package:iconsax/iconsax.dart';

class ReportsScreen extends StatefulWidget {
   ReportsScreen({super.key});

  static const routeName = '/login';

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  int touchedIndex = -1;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reports"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              height: 2),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          height: MediaQueryHelper.sizeFromHeight(context, 4),
                          width: MediaQueryHelper.sizeFromWidth(context, 1),
                          child:  AspectRatio(
                            aspectRatio: 1.3,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  height: 18,
                                ),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: PieChart(
                                      PieChartData(
                                        pieTouchData: PieTouchData(
                                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
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
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 40,
                                        sections: showingSections(),
                                      ),
                                    ),
                                  ),
                                ),
                                 const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Indicator(

                                      color: AppColors.lightPink,
                                      text: 'First',
                                      isSquare: true,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Indicator(
                                      color: AppColors.red,
                                      text: 'Second',
                                      isSquare: true,
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),

                      ]),
                ),
              ),
            ],
          ),
        )),
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
            color: AppColors.mediumGrey,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.pink,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.red,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
