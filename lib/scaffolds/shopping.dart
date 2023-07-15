import 'package:ecommerceproject/models/home_model.dart';
import 'package:ecommerceproject/scaffolds/payment.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/customedappbar.dart';
import 'customshopping.dart';

class Shopping extends StatelessWidget {
  var height, width, size;

  //Product? product;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // TODO: implement build

    return Scaffold(
      appBar: CustomedAppBar("Shopping Cart", null),
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Custom(
                  // "assets/images/ecommerceproducts/lablo2.jpeg",
                  // "Apple MacBook Pro",
                  // "44500",
                  Products[index].image,
                  Products[index].name,
                  Products[index].price.toString(),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.4),
                    child: Text(
                      "6738",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Row(
              children: [
                Text(
                  "Shipping fees",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.3),
                  child: Text(
                    "60",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.2,
              right: width * 0.2,
              top: width * 0.08,
              bottom: width * 0.05,
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment()));
              },
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              color: Color.fromRGBO(4, 131, 153, 1),
            ),
          )
        ],
      ),
    );
  }
}
