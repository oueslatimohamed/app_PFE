import 'package:flutter/material.dart';
import 'package:talebcom_app/constant.dart';

class SliderComponent extends StatefulWidget {
  @override
  _SliderComponentState createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  static double _lowerValue = 0;
  static double _upperValue = 100;

  RangeValues values = RangeValues(_lowerValue, _upperValue);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 10,
        overlayColor: fourColor,
        minThumbSeparation: 100,
        rangeThumbShape: RoundRangeSliderThumbShape(
          enabledThumbRadius: 10,
          disabledThumbRadius: 10,
        ),
      ),
      child: RangeSlider(
        activeColor: primaryColor,
        inactiveColor: fourColor,
        labels: RangeLabels(values.start.toString(),values.end.toString()),
        min: 0,
        max: 1000,
        divisions: 100,
        values: values,
        onChanged: (val) {
          setState(() {
            values = val;
            print(values.start);
            print(values.end);
          });
        },
      ),
    );
  }
}
