import 'package:Animate2/second.dart';
import 'package:flutter/material.dart';

class Animate extends StatefulWidget {
  @override
  _AnimateState createState() => _AnimateState();
}

class _AnimateState extends State<Animate> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animate1;
  var animate2;
  @override
  void initState() {
    super.initState();
    animate1 = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animate2 = CurvedAnimation(parent: animate1, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {
          print(animate2.value);
        });
      });
    animate1.forward();
    //print(animate1);
    //print(animate2);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ANIMATE',
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.red,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          animate1.forward(from: 0.5);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Second()));
        },
        child: Center(
          child: Card(
            color: Colors.white,
            child: Container(
              width: 100 * animate2.value,
              height: 100 * animate2.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: Center(
                child: Container(
                  width: 50 * animate2.value,
                  height: 50 * animate2.value,
                  child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 30 * animate2.value + 5, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
