import 'package:flutter/material.dart';
import 'package:flutter_app/homePage.dart';

class A extends StatefulWidget {

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> with TickerProviderStateMixin {

  AnimationController c;

  @override
  void initState() {
    super.initState();
    c = AnimationController(duration: Duration(milliseconds: 250), vsync: this);
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: c,
            builder: (context, child){
              return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.translate(
                        offset: Offset(0, c.value > 0 ? c.value * -300 : 0),
                        child: Transform(
                            transform: Matrix4.identity()
                              ..setEntry(c.value > 0 ? 3 : 1, c.value > 0 ? 2 : 0, c.value > 0 ? 0.01 : 0)
                              ..rotateX(c.value <= 0.02 ? c.value : 0.02),
                            alignment: FractionalOffset.topCenter,
                            child: getView()
                        )
                    ),
                    Transform.translate(
                        offset: Offset(0, c.value == 0 ? 300 : 300 - c.value * 1.2 * 300),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: Container(
                              height: 300,
                              width: double.infinity,
                              color: Colors.white,
                              child: Center(
                                  child: TextButton(
                                    onPressed: () => c.reverse(),
                                    child: Text('reverse', style: TextStyle(color: Colors.white)),
                                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((_) => Colors.blue))
                                  )
                              )
                          ),
                        )
                    )
                  ]
              );
            }
        )
    );
  }

  Widget getView(){
    return InkWell(
        onTap: () => c.forward(),
        child: HomePage()
    );
  }
}