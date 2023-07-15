import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './AddNewProductScreen.dart';
import 'AdminHomeScreen.dart';

class ProductScreenAdmin extends StatelessWidget {
  const ProductScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar("Products", null),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewProductScreen()));},
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Color.fromRGBO(4, 131, 153 ,0.5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNewProductScreen()));
                        },
                      ),
                      Text(
                        'Add New Product',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Text('');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
