import 'package:admin_panel_flutter/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.pieChartList,
  });

  final List<PieChartSectionData> pieChartList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(PieChartData(
                sectionsSpace: 2,
                // centerSpaceRadius: 70,
                startDegreeOffset: -90,
                sections: pieChartList)),
            Positioned.fill(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "29.1",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: .5),
                ),
                Text(
                  "of 128GB",
                ),
              ],
            ))
          ],
        ));
  }
}
