import 'package:flutter/material.dart';
import 'opart_model.dart';
import 'settings_model.dart';
import 'dart:math';

OpArt fibonacci = OpArt(
  opArtType: OpArtType.Fibonacci,
  name: 'Fibonacci',
  image: '',
);

List<String> list = List();

void initializeFibonacci() {
  fibonacci.attributes.addAll([
    SettingsModelDouble(
      label: 'Angle Increment',
      tooltip: 'The angle in radians between successive petals of the flower',
      min: 0,
      max: 2 * pi,
      zoom: 2000,
      defaultValue: (sqrt(5) + 1) / 2,
      icon: Icon(Icons.track_changes),
      proFeature: false,
    ),
    SettingsModelDouble(
      label: 'Petal Size',
      tooltip:
          'The size of the petal as a multiple of its distance from the centre',
      min: 0.01,
      max: 0.5,
      zoom: 100,
      defaultValue: 0.3,
      icon: Icon(Icons.swap_horizontal_circle),
      proFeature: false,
    ),
  ]);
}

//   @override
//   Map<String,dynamic> toMap() {
//     Map<String, dynamic> map = super.toMap();
//     map.addAll(
//         {'angleIncrement': angleIncrement, 'petalToRadius': petalToRadius});
//     return map;
//   }
//
//   @override
//   void fromMap(Map<String, dynamic> map) {
//     this.angleIncrement = map['angleIncrement'];
//     this.petalToRadius = map['petalToRadius'];
//     super.fromMap(map);
//   }
// }
