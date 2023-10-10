import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(ToastDemo());
}
class ToastDemo extends StatefulWidget {
 @override
 _ToastDemoState createState() => _ToastDemoState();
}
class _ToastDemoState extends State<ToastDemo> {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Demo toast widget',
 home: Scaffold(
 appBar: AppBar(
 title: Text('Demo toast widget'),
 ),
 body: Padding(
 padding: EdgeInsets.all(15.0),
 child: Center(
 child: ElevatedButton(
 child: Text('Tekan untuk menampilkan toast'),
 onPressed: showToast,
 ),
 ),
 )
 ),
 );
 }
 void showToast() {
 Fluttertoast.showToast(
 msg: 'Demo notifikasi toast',
 toastLength: Toast.LENGTH_SHORT,
 gravity: ToastGravity.BOTTOM,
 timeInSecForIosWeb: 1,
 backgroundColor: Colors.red,
 textColor: Colors.yellow
 );
 }}