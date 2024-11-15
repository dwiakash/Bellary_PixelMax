import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/models/shop.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/api/api_services.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:flutter/material.dart';

class ShopRepository {
  final APIService _api = APIService();

  Future<bool> getShops(BuildContext context) async {
    shopProvider.isLoading = true;
    ResponseData responseData = await _api.get(context, 'shop');
    shopProvider.isLoading = false;
    if (responseData.hasError) return false;
    List<Shop> shops = Shop().fromJsonList(responseData.data['data'] ?? "");
    shopProvider.shops = shops;
    return true;
  }
}
