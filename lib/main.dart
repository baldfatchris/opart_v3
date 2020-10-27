import 'package:flutter/material.dart';
import 'opart_model.dart';
import 'dart:math';

Random rnd = Random();


void main() {

  runApp(OpArtLab());
}

class OpArtLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  OpArt opArt = OpArt.fibonacci(opArtType: OpArtType.Fibonacci);


  void _incrementCounter() {

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: ListView.builder(
      //     itemCount: opArt.attributes.length,
      //     itemBuilder: (context, index){
      //       return Padding(
      //         padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      //           child: Card(
      //             child: ListTile(
      //
      //               title: Text(opArt.attributes[index].name + ' - ' + opArt.attributes[index].value.toString()),
      //
      //
      //             ),
      //
      //         ),
      //
      //       );
      //     }
      // )
      body: ListView(children: <Widget>[
        Text(
          'Canvas',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Container(
          width: 400,
          height: 400,
          child: CustomPaint(
            painter: OpArtPainter(this.opArt, 3.1415),
          ),
        ),
      ]),

      // body: CustomPaint(
      //   painter: OpArtPainter(this.opArt, 3.1415),
      // ),

    );
  }
}

class OpArtPainter extends CustomPainter {
  OpArt opArt;
  double animationVariable;

  OpArtPainter(
    this.opArt,
    this.animationVariable,
  );

  @override
  void paint(Canvas canvas, Size size) {

    opArt.paint(canvas, size, rnd, animationVariable);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}