import 'palette.dart';
import 'palette.dart';

enum OpArtType {
  Fibonacci, Trees, Waves, Wallpaper
}

class OpArt {
  OpArtType opArtType;
  OpartPalette palette = OpartPalette();
  String name = 'Fibonacci';

  randomizePalette() {
  }

  Map<String,dynamic> toMap(){
    Map<String, dynamic> currentMap = {'opArtType': this.opArtType, 'palette': this.palette,};
    return currentMap;
  }
  void fromMap(Map<String, dynamic> map){
    this.opArtType = map['opArtType'];
    this.palette = map['palette'];

  }
}
