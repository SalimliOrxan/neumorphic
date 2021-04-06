import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: Duration(milliseconds: 700));

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Neumorphic(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none
                          )
                      ),
                      style: NeumorphicStyle(
                          depth: -5,
                          surfaceIntensity: 0,
                          color: Colors.white
                      )
                  )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Neumorphic(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                            textInputAction: TextInputAction.send,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none
                            )
                        ),
                        style: NeumorphicStyle(
                            depth: -5,
                            surfaceIntensity: 0,
                            color: Colors.white
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      NeumorphicButton(
                          onPressed: () {
                            controller.forward();
                            controller.addStatusListener((status) {
                              if(status == AnimationStatus.completed){
                                controller.reverse();
                              }
                              else if(status == AnimationStatus.dismissed){
                                controller.forward();
                              }
                            });
                            },// Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => A())),
                          child: Center(child: Text('Login', style: TextStyle(color: Colors.black))),
                          padding: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              depth: 9,
                              surfaceIntensity: 0,
                              color: Color(0xFFF5EFEF)
                          )
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (_, child){
                            return Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Container(
                                  decoration: _background(),
                                  width: (MediaQuery.of(context).size.width - 55) * controller.value,
                                  height: 3
                              )
                            );
                          }
                      )
                    ]
                  )
                )
              ]
          )
        )
    );
  }

  BoxDecoration _background(){
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF654ea3),
              Color(0xFFeaafc8)
            ]
        )
    );
  }
}