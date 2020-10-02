import 'package:Animate2/animate.dart';
import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animate1;
  var animate2;
  @override
  void initState() {
    super.initState();
    animate1 = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animate2 = CurvedAnimation(parent: animate1, curve: Curves.easeInBack)
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
              context, MaterialPageRoute(builder: (context) => Animate()));
        },
        child: Center(
          child: Card(
            color: Colors.white,
            child: Container(
              width: 300 * animate2.value + 50,
              height: 300 * animate2.value + 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 150 * animate2.value + 50,
                  height: 150 * animate2.value + 50,
                  child: Text(
                    '3',
                    style: TextStyle(
                        fontSize: 130 * animate2.value + 5,
                        color: Colors.black),
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
