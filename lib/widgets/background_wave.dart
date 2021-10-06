import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class BackgroundWave extends StatelessWidget {
  const BackgroundWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [Colors.purple, Colors.purpleAccent],
          [Colors.deepOrange, Colors.deepOrangeAccent],
          [Colors.pink[700]!, Colors.pinkAccent],
        ],
        durations: [35000, 19440, 10800],
        heightPercentages: [0.20, 0.3, 0.45],
        blur: const MaskFilter.blur(BlurStyle.solid, 5),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      size: const Size(
        double.infinity,
        double.infinity,
      ),
    );
  }
}
