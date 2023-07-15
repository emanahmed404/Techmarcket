import 'package:ecommerceproject/shared/widgets/customedappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar("Add New Product",null),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
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

                        },
                      ),
                      Text(
                        'Add Image',
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Product Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildTextFormField('Product ID'),
              _buildTextFormField('Product Name'),
              _buildTextFormField('Product Description'),
              _buildTextFormField('Product Category'),
              const SizedBox(
                height: 10,
              ),
              _buildSlider('price'),
              _buildSlider('Quantity'),
              const SizedBox(
                height: 10,
              ),
              _buildCheckBox('Recomeneded'),
              _buildCheckBox('Popular'),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (() {
                    print('Save');
                  }),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildCheckBox(String title) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
        Checkbox(
          value: true,
          onChanged: (value) {

          },
          checkColor: Colors.grey,
          activeColor: Color.fromRGBO(4, 131, 153 ,0.3),
        ),
      ],
    );
  }

  Row _buildSlider(String title) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ),
        Expanded(
          child: Slider(
            value: 0,
            min: 0,
            max: 25,
            divisions: 10,
            activeColor:Color.fromRGBO(4, 131, 153 ,1),
            inactiveColor: Color.fromRGBO(4, 131, 153 ,0.3),
            onChanged: (Value) {},
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
