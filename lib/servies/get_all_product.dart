import '../Models/product_Model.dart';
import '../helper/ApiClass.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: "https://fakestoreapi.com/products");
    return data.map((json) => ProductModel.fromjson(json)).toList();
  }
}