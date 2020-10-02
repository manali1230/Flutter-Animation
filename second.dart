import 'package:Animate2/animate.dart';
import 'package:Animate2/third.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animate1;
  var animate2;
  @override
  void initState() {
    super.initState();
    animate1 = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animate2 = CurvedAnimation(parent: animate1, curve: Curves.easeInOutCirc)
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
        shadowColor: Colors.blueGrey,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          animate1.forward(from: 0.5);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Third()));
        },
        child: Center(
          child: Card(
            color: Colors.white,
            child: Container(
              width: 200 * animate2.value + 50,
              height: 200 * animate2.value + 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepOrangeAccent,
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 100 * animate2.value + 50,
                  height: 100 * animate2.value + 50,
                  child: Text(
                    '2',
                    style: TextStyle(
                        fontSize: 80 * animate2.value + 5, color: Colors.black),
                    textAlign: TextAlign.center,
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
