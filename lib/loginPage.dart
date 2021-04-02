import 'package:flutter/material.dart';
import 'package:flutter_app/animation.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
              children: [
                Neumorphic(
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
                  child: NeumorphicButton(
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => A())),
                      child: Center(child: Text('Login', style: TextStyle(color: Colors.black))),
                      padding: EdgeInsets.all(10),
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          depth: 9,
                          surfaceIntensity: 0,
                          color: Color(0xFFF5EFEF)
                      )
                  ),
                )
              ]
          )
        )
    );
  }
}

