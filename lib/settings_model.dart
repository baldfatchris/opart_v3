import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';

bool proVersion = false;

enum SettingType { double, int, bool, button, color, setDefault, randomize }

class SettingsModel {
  String label;
  Icon icon;
  bool proFeature;
  String tooltip;
  SettingType settingType;
  Random rnd = Random();
  // SettingsModel(this.label, this.icon, this.proFeature, this.tooltip, this.settingType);
}

class SettingsModelDouble extends SettingsModel {
  double value;
  bool locked = false;

  final double min;
  final double max;
  final double randomMin;
  final double randomMax;
  final double zoom;
  final double defaultValue;

  SettingsModelDouble({
    this.min,
    this.max,
    this.randomMin,
    this.randomMax,
    this.zoom,
    this.defaultValue,
    this.value,
    String label,
    Icon icon,
    bool proFeature,
    String tooltip,
    SettingType settingType,
  }) : super();

  void setDefault() {
    this.value = this.defaultValue;
  }

  void randomize() {
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
