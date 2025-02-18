import 'dart:convert';

import 'package:store_app/Models/product_Model.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/ApiClass.dart';
class Categoriesserives{
 Future <List<ProductModel>> getcateogries({required String categoryname})async{
  
     List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products/category/$categoryname");
     List<ProductModel> producetList = [];
     for (int i = 0; i < data.length; i++) {
       producetList.add(
         ProductModel.fromjson(data[i]),
       );
     }
     return producetList;
   
 }
}