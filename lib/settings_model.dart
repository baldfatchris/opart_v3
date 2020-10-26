import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';

bool proVersion = false;

enum SettingType { double, int, bool, button, color, setDefault, randomize }

class SettingsModel {

  SettingType settingType;
  String label;
  String tooltip;
  Icon icon;
  bool proFeature;

  double min;
  double max;
  double randomMin;
  double randomMax;
  double zoom;
  var defaultValue;

  bool locked;
  var value;

  SettingsModel({this.settingType, this.label, this.tooltip, this.icon, this.proFeature, this.min, this.max, this.randomMin, this.randomMax, this.zoom, this.defaultValue});

  void randomize(Random rnd){
    if (!this.locked && (proVersion || !proVersion && !this.proFeature)) {

      switch (this.settingType) {

        case SettingType.double:

          double min = (this.randomMin != null) ? this.randomMin : this.min;
          double max = (this.randomMax != null) ? this.randomMax : this.max;

          // half the time use the default
          this.value = (rnd.nextBool() == true)
              ? rnd.nextDouble() * (max - min) + min
              : this.defaultValue;

          break;

        case SettingType.int:
            int min = (this.randomMin != null) ? this.randomMin.toInt() : this.min.toInt();
            int max = (this.randomMax != null) ? this.randomMax.toInt() : this.max.toInt();

            // half the time use the default
            this.value = (rnd.nextBool() == true)
                ? rnd.nextInt(max - min) + min
                : this.defaultValue;

            break;

        case SettingType.bool:

          this.value = rnd.nextBool();

          break;

        case SettingType.color:

          this.value = Color((rnd.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);

          break;

        case SettingType.button:

          this.value = false;

          break;
      }
    }
  }

  void setDefault(){
    this.value = this.defaultValue;
  }

}

