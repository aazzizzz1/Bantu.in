import 'package:bantuin/models/product_point_model.dart';
import 'package:flutter/material.dart';

import '../services/api/apps_repository.dart';

class ProductViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<DetailProductPointModel> _listOfProduct = [];
  List<DetailProductPointModel> get listOfProduct => _listOfProduct;

  Future<void> fetchProduct() async {
    try {
      _listOfProduct = await appsRepository.getProduct();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> reedemPoint(DetailProductPointModel point) async {
    try {
      await appsRepository.postTransaction(point.id, point.name);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
