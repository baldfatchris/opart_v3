import 'package:flutter/material.dart';
import 'opart_model.dart';
import 'settings_model.dart';
import 'dart:math';

class fibonacci extends opArt {

  SettingsModelDouble angleIncrement = SettingsModelDouble(
    label: 'Angle Increment',
    tooltip: 'The angle in radians between successive petals of the flower',
    min: 0,
    max: 2 * pi,
    zoom: 2000,
    defaultValue: (sqrt(5) + 1) / 2,
    icon: Icon(Icons.track_changes),
    proFeature: false,
  );




}
