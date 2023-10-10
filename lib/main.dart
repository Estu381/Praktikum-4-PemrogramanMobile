import 'package:flutter/material.dart';

void main() {
  runApp(TapDemo());
}

class TapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo gesture'),
          centerTitle: true,
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              print('Area kotak telah ditekan');
            },
            child: Container(
              height: 60.0,
              width: 120.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(child: Text('Tekan')),
            ),
          ),
        ),
      ),
    );
  }
}