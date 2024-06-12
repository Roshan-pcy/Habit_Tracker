import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:habit_trakcer/dateTime/dateTime.dart';

class Monthly extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const Monthly({super.key, required this.datasets, required this.startDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(const Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(255, 3, 44, 10),
          3: Color.fromARGB(255, 7, 54, 10),
          5: Color.fromARGB(255, 16, 99, 28),
          7: Color.fromARGB(255, 30, 126, 34),
          9: Color.fromARGB(255, 29, 166, 93),
          11: Color.fromARGB(255, 34, 196, 69),
          13: Color.fromARGB(255, 6, 239, 115),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
