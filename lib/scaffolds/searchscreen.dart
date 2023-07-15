import 'dart:convert';

import 'package:ecommerceproject/shared/widgets/box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/usermodel.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  UserModel? userModel;

  var size, height, width;

  TextEditingController search = new TextEditingController();
  void getDataFromAPI() async {
    var response =
    await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    print(response.body);
    setState(() {
      userModel = UserModel.fromJson(json.decode(response.body));
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor:  Color.fromRGBO(239, 241, 245, 1),
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.05),
            child: Autocomplete<Data>(
              optionsBuilder: (TextEditingValue value) {
                if(value.text.isEmpty){
                  return List.empty();
                } else
                  return userModel!.data!.where((element) => element.firstName!
                      .toLowerCase()
                      .contains(value.text.toLowerCase()));
              },
              fieldViewBuilder: (BuildContext context, TextEditingController controller, FocusNode node, Function onSumbit ) => TextFormField(
                  controller: controller,
                  focusNode: node,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: Colors.white,
                    // floatingLabelStyle:  TextStyle(color: lavender),
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(4, 131, 153 ,1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width:1.5),
                    ),
                    labelText: 'Search',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
                  )
              ),
              optionsViewBuilder: (BuildContext context, Function onSelect, Iterable<Data>dataList){
                return Material(
                  child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder:(context, index){
                      Data d = dataList.elementAt(index);
                      return (index==dataList.length-1)?  Padding(
                        padding:  EdgeInsets.only(right: width*0.1,left: width*0.02,bottom: height*0.3),
                        child: SearchContainer(d.email!,d.firstName,d.lastName,d.avatar),
                      ) :  Padding(
                        padding:  EdgeInsets.only(right: width*0.1,left: width*0.02,bottom: height*0.02),
                        child:SearchContainer(d.email!,d.firstName,d.lastName,d.avatar),
                        //FlightContainer(d.email!,d.firstName,d.lastName,d.avatar),
                      );
                    } ,),
                );
              },
              //onSelected: (value)=> , navigate 3la el page bta3t el ticket
              displayStringForOption: (Data d)=> "${d.firstName!} ${d.lastName} ",

            ),
          ),
        ],
      ),
    );
  }
}

//
// class SearchBody extends StatefulWidget {
//   const SearchBody({Key? key}) : super(key: key);
//
//   @override
//   State<SearchBody> createState() => _SearchBodyState();
// }
//
// class _SearchBodyState extends State<SearchBody> {
//   UserModel? userModel;
//   var size, height, width;
//   TextEditingController search = new TextEditingController();
//
//   void getDataFromAPI() async {
//     var response =
//     await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
//     print(response.body);
//     setState(() {
//       userModel = UserModel.fromJson(json.decode(response.body));
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getDataFromAPI();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//
//     return SafeArea(
//       child:
//     );
//   }
// }
