import 'package:admin_panel_flutter/constants.dart';
import 'package:admin_panel_flutter/models/myFilesModel.dart';
import 'package:admin_panel_flutter/models/recentFiles.dart';
import 'package:admin_panel_flutter/responsive.dart';
import 'package:admin_panel_flutter/screens/components/chart.dart';
import 'package:admin_panel_flutter/screens/components/header.dart';
import 'package:admin_panel_flutter/screens/components/myfiles.dart';
import 'package:admin_panel_flutter/screens/components/storage_info_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  var pieChartList = [
    PieChartSectionData(value: 25, color: primaryColor, showTitle: true),
    PieChartSectionData(value: 15),
    PieChartSectionData(value: 45),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          MyFiles(),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Recent Files"),
                                SizedBox(
                                  width: double.infinity,
                                  child: DataTable(
                                      columnSpacing: defaultPadding,
                                      horizontalMargin: 0,
                                      columns: const [
                                        DataColumn(label: Text("File Name")),
                                        DataColumn(label: Text("Date")),
                                        DataColumn(label: Text("Size")),
                                      ],
                                      rows: List.generate(
                                          demoRecentFiles.length,
                                          (index) => RecentRow(
                                              demoRecentFiles[index]))),
                                ),
                                if (Responsive.isMobile(context))
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                if (Responsive.isMobile(context))
                                  StorageDetails(pieChartList: pieChartList),
                              ],
                            ),
                          ),
                        ],
                      )),
                  if (!Responsive.isMobile(context))
                    const SizedBox(
                      width: defaultPadding,
                    ),
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: StorageDetails(pieChartList: pieChartList),
                    ),
                ],
              ),
            ],
          )),
    );
  }

  DataRow RecentRow(RecentFile recentFileInfo) {
    return DataRow(cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              recentFileInfo.icon.toString(),
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Text(demoRecentFiles[0].title.toString())
          ],
        ),
      ),
      DataCell(Text(recentFileInfo.title.toString())),
      DataCell(Text(recentFileInfo.size.toString())),
    ]);
  }
}

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
    required this.pieChartList,
  });

  final List<PieChartSectionData> pieChartList;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Storage Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Chart(pieChartList: pieChartList),
          const SizedBox(
            height: defaultPadding,
          ),
          const StorageInfo(
            title: "Document Files",
            svgSource: 'assets/icons/Documents.svg',
            amountOfFiles: "1.3GB",
            numOffiles: 1382,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const StorageInfo(
            title: "Media Files",
            svgSource: 'assets/icons/Documents.svg',
            amountOfFiles: "1.9GB",
            numOffiles: 1122,
          ),
          const StorageInfo(
            title: "Document Files",
            svgSource: 'assets/icons/Documents.svg',
            amountOfFiles: "1.3GB",
            numOffiles: 1382,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const StorageInfo(
            title: "Media Files",
            svgSource: 'assets/icons/Documents.svg',
            amountOfFiles: "1.9GB",
            numOffiles: 1122,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }
}
