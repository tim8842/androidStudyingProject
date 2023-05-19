import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class BarSliderSegment extends StatelessWidget {
  Function valueChangedFunc;
  BarSliderSegment({super.key, required this.valueChangedFunc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomSlidingSegmentedControl<int>(
        initialValue: 0,
        children: const {
          0: Text('Сегодня'),
          1: Text('Завтра'),
          2: Text('Неделя'),
        },
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        thumbDecoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        onValueChanged: (v) {
          valueChangedFunc(v);
        },
      ),
    );
  }
}
