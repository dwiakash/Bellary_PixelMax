import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/api/api_services.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:flutter/material.dart';

class CategoryRepository {
  final APIService _api = APIService();

  Future<bool> getProductCategories(BuildContext context) async {
    categoryProvider.isLoading = true;
    ResponseData responseData = await _api.get(context, 'product-category');
    categoryProvider.isLoading = false;
    if (responseData.hasError) return false;
    List<Category> categories =
        Category().fromJsonList(responseData.data['data'] ?? "");
    categoryProvider.productCategories = categories;
    return true;
  }

  Future<bool> getServiceCategories(BuildContext context) async {
    categoryProvider.isLoading = true;
    ResponseData responseData = await _api.get(context, 'service-category');
    categoryProvider.isLoading = false;
    if (responseData.hasError) return false;
    List<Category> categories =
        Category().fromJsonList(responseData.data['data'] ?? "");
    categoryProvider.serviceCategories = categories;
    return true;
  }
}
