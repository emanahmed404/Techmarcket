import 'package:ecommerceproject/scaffolds/shopping.dart';
import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit/layoutCubit.dart';
import '../layout/cubit/states.dart';


class ShopLayOutScreen extends StatelessWidget {
  const ShopLayOutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomedAppBar("Home",IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Shopping()));
          }, icon:Icon( Icons.shopping_cart_rounded),)),
          body:
          AppCubit.get(context).bottomNavBarList[AppCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(

            onTap: (index){
              AppCubit.get(context).changeBottomNav(index,context);
            },
            currentIndex: AppCubit.get(context).currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon :Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon :Icon(Icons.category_outlined),
                  label: 'Category'),
              BottomNavigationBarItem(
                  icon :Icon(Icons.search_outlined),
                  label: 'search'),

            ],
          ),
        );
      },
    );
  }
}
