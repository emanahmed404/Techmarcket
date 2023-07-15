import 'dart:convert';


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication/authentication_methods.dart';
import '../main.dart';
import '../responsivness/responsivness.dart';
import '../shared/widgets/customedbutton.dart';
import '../shared/widgets/customedtextfield.dart';
import '../shared/widgets/util.dart';
import 'layoutScreen.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  TextEditingController? email= new TextEditingController();
  TextEditingController? password= new TextEditingController();
  TextEditingController? name= new TextEditingController();
  TextEditingController? phone= new TextEditingController();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var width, height, size ;


  bool passwordVisible = false;
  bool isSecure = true;
  String dropdownvalue = 'Male';
  var items = ['Male', 'Female'];
  final formKey = GlobalKey<FormState>();

  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    size= MediaQuery.of(context).size;
    height= size.height;
    width= size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 131, 153 ,1),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: height*0.075),
                child: Text('Create Account', style:TextStyle(color: Colors.white, fontWeight: FontWeight.w900,fontFamily: 'sign', fontSize: 35) ,),
              ),
              Padding(
                padding:  EdgeInsets.only(top: height*0.02),
                child: Text('to get started now!', style:TextStyle(color: Colors.white,fontFamily: 'sign', fontSize: 35) ,),
              ),
              Padding(
                padding: EdgeInsets.only(top: Responsive.screenHeight*0.04),
                child: Container( width: Responsive.screenWidth,
                  height: Responsive.screenHeight*0.762,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150)
                      )
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.1,left: width*0.05, right: width*0.05),
                        child: FormFields("Name", Icon(Icons.perm_identity, color: Colors.black,),null, false, widget.name!, Colors.transparent, Colors.white),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.01,left: width*0.05, right: width*0.05),
                        child: FormFields("Email", Icon(Icons.email, color: Colors.black,),null, false, widget.email!, Colors.transparent,Colors.white),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.01,left: width*0.05, right: width*0.05),
                        child: FormFields("Phone", Icon(Icons.phone, color: Colors.black,),null, false, widget.phone!, Colors.transparent,Colors.white),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.01,left: width*0.05, right: width*0.05),
                        child: FormFields("PassWord",  IconButton(
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
                        ), isSecure , widget.password!, Colors.transparent,Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top:
                            MediaQuery.of(context).size.width * 0.03),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                  MediaQuery.of(context).size.width *
                                      0.2),
                              child: const Text(
                                "Gender:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: "alef",
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                  MediaQuery.of(context).size.width *
                                      0.17),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  items: items
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight:
                                            FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ))
                                      .toList(),
                                  value: dropdownvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      dropdownvalue = value as String;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle,
                                    size: 20,
                                  ),
                                  iconSize: 16,
                                  iconEnabledColor: Colors.black,
                                  buttonHeight: 50,
                                  buttonWidth: 160,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius:
                                  const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.02),
                        child: Button(Text('SignUp', style: TextStyle(fontFamily: 'sign', fontSize: 22, fontWeight: FontWeight.w900,color: Colors.white)), Color.fromRGBO(4, 131, 153 ,1), Colors.transparent, ()async{
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            String output =
                            await authenticationMethods.signUpUser(
                                name: widget.name!.text,
                                phone: widget.phone!.text,
                                email: widget.email!.text,
                                password: widget.password!.text,
                              type: dropdownvalue
                                );
                            print(output);
                            if (output == "success" ) {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopLayOutScreen()));
                            }
                            else {
                              Utils().showSnackBar(
                                  context: context, content: output);
                            }
                          } else{

                            Utils().showSnackBar(
                                context: context, content: "Please Enter your data.");
                          }
                            }),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.01, left:width*0.15),
                        child: Row(
                          children: [
                            Text('Already have an account', style: TextStyle(fontFamily: 'sign', fontSize:15, color: Colors.black, decorationColor: Colors.white),),
                            GestureDetector(child: Text('?LogIn now', style: TextStyle(fontFamily: 'sign', fontSize:17, color: Colors.black54, decoration: TextDecoration.underline, decorationColor: Colors.black54),),onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));

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