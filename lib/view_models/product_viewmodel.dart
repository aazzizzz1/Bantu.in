import 'package:bantuin/models/product_point_model.dart';
import 'package:flutter/material.dart';

import '../services/api/apps_repository.dart';
import '../utils/app_state.dart';

class ProductViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<DetailProductPointModel> _listOfProduct = [];
  List<DetailProductPointModel> get listOfProduct => _listOfProduct;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  Future<void> fetchProduct() async {
    try {
      changeAppState(AppState.loading);
      _listOfProduct = await appsRepository.getProduct();
      notifyListeners();
      changeAppState(AppState.loaded);

      if (_listOfProduct.isEmpty) {
        changeAppState(AppState.noData);
        notifyListeners();
      }
    } catch (e) {
      changeAppState(AppState.failure);
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
