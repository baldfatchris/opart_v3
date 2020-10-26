import 'opart_fibonacci.dart';
import 'palette.dart';
import 'settings_model.dart';
import 'package:flutter/material.dart';
enum OpArtType { Fibonacci, Trees, Waves, Wallpaper }

class OpArt {
  OpArtType opArtType;
  OpartPalette palette = OpartPalette();
  String name = 'Fibonacci';
  List<SettingsModel> attributes = List<SettingsModel>();
  String image;

  OpArt({
    this.opArtType,
    this.name,
    this.image
  });

List<Map<String, dynamic>> cache = List();


  void saveToCache(){
    Map<String, dynamic> map = Map();
    for(int i = 0; i< attributes.length; i++){
      map.addAll({attributes[i].label: attributes[i].value});
    }
  }
  void revertToCache(){

  }
  void initialise() {
    switch (opArtType) {
      case OpArtType.Fibonacci:
        initializeFibonacci();
    }
  }

  void randomize() {
    for (int i = 0; i < attributes.length; i++) {
      attributes[i].randomize();
    }
  }

  void reset() {
    for (int i = 0; i < attributes.length; i++) {
      attributes[i].reset();
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
