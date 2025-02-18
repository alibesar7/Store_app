import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/product_Model.dart';
import '../main.dart';
import '../widget/custom_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const String id = "Homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductServices().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CustomCard(product: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: Text("Failed to load products"));
          }
        },
      ),
    );
  }
}