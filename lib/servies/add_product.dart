import 'package:http/http.dart' as http;
import 'package:store_app/Models/product_Model.dart';
import 'package:store_app/helper/ApiClass.dart';
class AddProduct{
  Future<ProductModel>addproduct({required String title,
    required String price,
    required String description,
    required String image,
    required String category})async{
     Map<String,dynamic>data = await Api().post(url: "https://fakestoreapi.com/products",
        body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
          "category": category
        });
     return ProductModel.fromjson(data);
  }
}