import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  ProgressLine({super.key, required this.percentage, this.color});

  final color;
  int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
        }),
      ],
    );
  }
}
