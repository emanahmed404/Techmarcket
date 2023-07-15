import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../models/home_model.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const   DetailsScreen({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 241, 245, 1),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              product.images[0],
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_rounded,
                                color: Colors.black87),
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.favorite_border,
                                color: Colors.black87),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                const Icon(Icons.shopping_cart, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.transparent,
                                spreadRadius: 1,
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            child: Image.asset(
                              product.image,
                              height: 250,
                              width: 180,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /////////////ta7t el sewar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 30,
                        ),
                        ////////////////////////////////////////////////////////

                        Text(
                          product.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,

                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(text: "Price\n",style: TextStyle(color: Colors.black54)),
                                  TextSpan(
                                    text: "\$${product.price}",
                                    style: Theme.of(context).textTheme.headline4?.copyWith(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(text: "Old Price\n",style: TextStyle(color: Colors.black54)),
                                  TextSpan(
                                    text: "\$${product.oldPrice}",
                                    style: Theme.of(context).textTheme.headline4?.copyWith(
                                        color: Colors.black54, fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough) ,
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
