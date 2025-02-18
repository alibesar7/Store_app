import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_app/screens/homepage.dart';
import 'package:store_app/screens/update_product_page.dart';
import 'package:http/http.dart'as http;
import 'package:store_app/widget/Custom_button.dart';
import 'package:store_app/widget/Custom_text_feild.dart';
import 'package:store_app/widget/custom_card.dart';

import 'Models/product_Model.dart';
import 'helper/ApiClass.dart';
void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => const Homepage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
      },
      initialRoute: Homepage.id,
    );
  }
}

class AllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products");
    return data.map((json) => ProductModel.fromjson(json)).toList();
  }
}
class UpdateProductPage extends StatelessWidget {
  static String id = "update product";
  String ?title,des,price,image;
  @override
  Widget build(BuildContext context) {
    final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              CustomTextField(hintText: "title"),
              const SizedBox(height: 10),
              CustomTextField(hintText:"description"),
              const SizedBox(height: 10),
              CustomTextField(hintText:"price", type: TextInputType.number),
              const SizedBox(height: 10),
              CustomTextField(hintText:"image",  ),
              const SizedBox(height: 10),
              CustomButton(onTap: () {
                 title= product.title;
                 price= product.price.toString();
                 des= product.description;
                 image= product.title;
              }, text: "Update"),
            ],
          ),
        ),
      ),
    );
  }
}

