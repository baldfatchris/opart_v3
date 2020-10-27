import 'opart_fibonacci.dart';
import 'palette.dart';
import 'settings_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum OpArtType { Fibonacci, Trees, Waves, Wallpaper }

class OpArt {
  OpArtType opArtType;
  OpArtPalette palette = OpArtPalette();
  List<SettingsModel> attributes = List<SettingsModel>();
  String image;
  List<Map<String, dynamic>> cache = List();
  Random rnd;

  OpArt.fibonacci({this.opArtType}) {
      this.attributes = initializeFibonacci();
      this.reset();

      print('palette name: ${this.palette.paletteName}');

  }

  void paint(Canvas canvas, Size size, Random rnd, double angle) {
    print('size.width: ${size.width}');

    switch(opArtType){
      case OpArtType.Fibonacci:
        paintFibonacci( canvas,  size,  rnd,  angle, attributes, palette);
    }

  }

  void reset(){
    for(int i = 0; i< attributes.length; i++){
      attributes[i].value = attributes[i].defaultValue;
    }

  }

  void saveToCache(){
    Map<String, dynamic> map = Map();
    for(int i = 0; i< attributes.length; i++){
      map.addAll({attributes[i].label: attributes[i].value});
    }
  }


  void revertToCache(){

  }


  void randomize() {
    for (int i = 0; i < attributes.length; i++) {
      attributes[i].randomize(rnd);
    }
  }

  void setDefault() {
    for (int i = 0; i < attributes.length; i++) {
      attributes[i].setDefault();
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> currentMap = {
      'opArtType': this.opArtType,
      'palette': this.palette,
    };
    return currentMap;
  }

  void fromMap(Map<String, dynamic> map) {
    this.opArtType = map['opArtType'];
    this.palette = map['palette'];
  }
}
