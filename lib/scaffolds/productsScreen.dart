
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit/layoutCubit.dart';
import '../layout/cubit/states.dart';
import '../models/home_model.dart';
import 'detailsScreen.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(builder: (BuildContext context, state) { return ProductBuilder(context); },
    listener: (BuildContext context, Object? state) {  }, );
  }
}

Widget ProductBuilder(context) => SingleChildScrollView(
       child: Column(
        mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
               physics: const AlwaysScrollableScrollPhysics(),
               crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.58,
              children: List.generate(
                Products.length,
                (index) => Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                        Navigator.push(context,  MaterialPageRoute(builder:  (context) => DetailsScreen( product:Products[index] ),));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Image(


                              image: AssetImage(Products[index].image),
                              width: double.infinity,
                              height: 200.0,
                            ),
                            if (Products[index].discount != 0)
                              Container(
                                color: Colors.pink,
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'DISCOUNT',
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Products[index].name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${Products[index].price}',
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.pinkAccent),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  if (Products[index].discount != 0)
                                    Text(
                                      '${Products[index].oldPrice.round()}',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
