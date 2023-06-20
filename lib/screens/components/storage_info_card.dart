import 'package:admin_panel_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorageInfo extends StatelessWidget {
  const StorageInfo(
      {super.key,
      required this.title,
      required this.amountOfFiles,
      required this.svgSource,
      required this.numOffiles});
  final String title, svgSource, amountOfFiles;
  final int numOffiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: primaryColor.withOpacity(.2)),
          borderRadius: BorderRadius.all(Radius.circular(defaultPadding))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSource),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${numOffiles.toString()} Files",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white70),
                ),
              ],
            ),
          )),
          Text(amountOfFiles)
        ],
      ),
    );
  }
}
