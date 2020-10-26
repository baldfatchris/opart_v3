import 'palette.dart';
import 'palette.dart';

enum OpArtType { Fibonacci, Trees, Waves, Wallpaper }

class OpArt {
  String opArtType;
  OpartPalette palette = OpartPalette();
  String name = 'Fibonacci';
  List<dynamic> attributes = List<dynamic>();
  OpArt({
    this.opArtType,
    this.name,
    }
  );
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
