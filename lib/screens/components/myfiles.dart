import 'package:admin_panel_flutter/constants.dart';
import 'package:admin_panel_flutter/models/myFilesModel.dart';
import 'package:admin_panel_flutter/responsive.dart';
import 'package:admin_panel_flutter/screens/components/progressLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My Files", style: Theme.of(context).textTheme.titleMedium),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding)),
              label: Text("Add New"),
            )
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Responsive(
          mobile: FileInfoGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            aspectRatio: size.width < 650 ? 1.3 : 1,
          ),
          desktop: FileInfoGridView(
            aspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
          tablet: FileInfoGridView(),
        )
      ],
    );
  }
}

class FileInfoGridView extends StatelessWidget {
  const FileInfoGridView({
    this.crossAxisCount = 4,
    this.aspectRatio = 1,
  });
  final crossAxisCount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: demoMyFiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: aspectRatio,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding),
        itemBuilder: (context, index) => FileClientInfoCard(
              info: demoMyFiles[index],
            ));
  }
}

class FileClientInfoCard extends StatelessWidget {
  const FileClientInfoCard({
    required this.info,
    super.key,
  });
  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * .50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: info.color!.withOpacity(.1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: SvgPicture.asset(info.svgSrc.toString()),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          Text(
            info.title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          ProgressLine(
            percentage: info.percentage!.toInt(),
            color: info.color,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiles} Files",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              ),
              Text(
                info.totalStorage.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              )
            ],
          )
        ],
      ),
    );
  }
}
