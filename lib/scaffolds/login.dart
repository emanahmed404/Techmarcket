import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceproject/scaffolds/layoutScreen.dart';
import 'package:ecommerceproject/responsivness/responsivness.dart';
import 'package:ecommerceproject/scaffolds/AdminHomeScreen.dart';
import 'package:ecommerceproject/scaffolds/productsScreen.dart';
import 'package:ecommerceproject/scaffolds/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../authentication/authentication_methods.dart';
import '../main.dart';
import '../shared/widgets/customedbutton.dart';
import '../shared/widgets/customedtextfield.dart';
import '../shared/widgets/util.dart';

import 'ProductScreen.dart';

class Login extends StatefulWidget {
  TextEditingController? email= new TextEditingController();

  TextEditingController? password= new TextEditingController();
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var width, height, size ;

  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  bool passwordVisible = false;
  bool isSecure = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
     size = MediaQuery.of(context).size;
     height = size.height;
     width = size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 131, 153 ,1),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: height*0.1),
                child: Text('Welcome,', style:TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontFamily: 'sign', fontSize: 35) ,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height*0.02),
                child: Text('Glad to see you!', style:TextStyle(color: Colors.white,fontFamily: 'sign', fontSize: 35) ,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: Responsive.screenHeight*0.05),
                child: Container(
                  width: Responsive.screenWidth,
                  height: Responsive.screenHeight*0.728,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150)
                    )
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.15,left: width*0.05, right: width*0.05),
                        child: FormFields("Email", Icon(Icons.mail, color: Colors.black,),null, false, widget.email!, Colors.transparent,Colors.white),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.05,left: width*0.05, right: width*0.05),
                        child: FormFields("Password",  IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.lock_open
                                : Icons.lock_outline,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isSecure = !isSecure;
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),  IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isSecure = !isSecure;
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ), isSecure , widget.password!, Colors.transparent,Colors.black),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.1),
                        child:
                        Button(Text('LogIn', style: TextStyle(fontFamily: 'sign', fontSize: 22, fontWeight: FontWeight.w900,color: Colors.white)), Color.fromRGBO(4, 131, 153 ,1), Colors.transparent, ()async{
                          if( widget.email!.text == "admin" &&
                              widget.password!.text == "admin") {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminHomeScreen()));
                          }
                          else if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            String output =
                            await authenticationMethods.logInUser(
                                email: widget.email!.text,
                                password:  widget.password!.text);

                            if (output == "success")  {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopLayOutScreen()));
                            } else {

                              Utils().showSnackBar(
                                  context: context, content: output);
                            }
                          } else {
                            Utils().showSnackBar(
                                context: context, content: "Please Enter your data." );
                          }
                        }),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.01, left:width*0.15),
                        child: Row(
                          children: [
                            Text('Don\'t have an account', style: TextStyle(fontFamily: 'sign', fontSize:15, color: Colors.black, decorationColor: Colors.white),),
                            GestureDetector(child: Text('?SignUp now', style: TextStyle(fontFamily: 'sign', fontSize:17, color: Colors.black54, decoration: TextDecoration.underline, decorationColor: Colors.black54),),onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                            },),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}