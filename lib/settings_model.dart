import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';

bool proVersion = false;

class SettingsModelDouble {
  double value;
  bool locked = false;
  final String label;
  final String tooltip;
  final Icon icon;
  final double min;
  final double max;
  final double randomMin;
  final double randomMax;
  final double zoom;
  final double defaultValue;
  final String type = 'Double';
  final bool proFeature;

  SettingsModelDouble(
      {this.label,
        this.tooltip,
        this.icon,
        this.min,
        this.max,
        this.randomMin,
        this.randomMax,
        this.zoom,
        this.defaultValue,
        this.value,
        this.proFeature});

  void setDefault(){
    this.value = this.defaultValue;
  }

  void randomize(Random rnd) {
    if (!this.locked && (proVersion || !proVersion && !this.proFeature)) {
      double min = (this.randomMin != null) ? this.randomMin : this.min;
      double max = (this.randomMax != null) ? this.randomMax : this.max;

      // half the time use the default
      this.value = (rnd.nextBool() == true)
          ? rnd.nextDouble() * (max - min) + min
          : this.defaultValue;
    }
  }
}