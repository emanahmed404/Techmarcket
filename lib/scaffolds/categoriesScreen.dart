import 'package:flutter/material.dart';

import '../models/home_model.dart';
import '../shared/widgets/categorybox.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  var cat= [
    "Fashion",
    "Electronics",
    "Jewelery",
    "Beauty",
    "Accessories",
    "Bags",
    "Active Wear",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing:10,
              mainAxisSpacing: 12,
              crossAxisCount: 3,
              //childAspectRatio: ,

              children:
              List.generate(7, (index) => GestureDetector(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> Products(welcome[index]["id"].toString())));
                  },
                  child: CategoryBox(cat[index])),
              ),
            ),

          )],
      ),
    );
  }
}
