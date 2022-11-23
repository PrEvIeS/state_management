import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:state_management/models/product_list.dart';

class CartHelper extends ChangeNotifier {
  Dio dio = Dio();
  int counter = 0;

   Future<ProductListModel> getProducts() async {
    var response = await dio.get('http://dummyjson.com/products');
    return ProductListModel.fromJson(response.data);
  }

  void addToCart() {
    counter++;
    notifyListeners();
  }
}
