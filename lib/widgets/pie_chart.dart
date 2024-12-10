import 'package:budget/logic/models/category.dart';
import 'package:budget/main.dart';
import 'package:budget/theme.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PieChartDefault extends StatefulWidget {
  final List<Category> categoryList;

  const PieChartDefault({super.key, required this.categoryList});

  @override
  State<StatefulWidget> createState() => PieChartDefaultState();
}

class PieChartDefaultState extends State<PieChartDefault> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: double.infinity,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    double totalSum = Category.getListSum(widget.categoryList);
    return List.generate(widget.categoryList.length, (i) {
      final fontSize = 16.0;
      final radius = 50.0;

      final category = widget.categoryList[i];

      return PieChartSectionData(
        color: category.color,
        value: category.totalSum,
        title: category.totalSum / totalSum * 100 < 1
            ? ''
            : '${NumberFormat.compact().format(category.totalSum / totalSum * 100)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: getAdaptiveColor(category.color),
        ),
      );
    });
  }
}
