import 'package:flutter/material.dart';

class MyCard extends StatefulWidget{
  int? value;
  MyCard(int val){
    this.value=val;
  }
  int? get getValue{
    return this.value;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 90.0,
      margin: const EdgeInsets.all(9.0),
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Text('$value'),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}