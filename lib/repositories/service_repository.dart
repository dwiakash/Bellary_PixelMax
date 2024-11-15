import 'package:bellaryapp/models/category.dart';
import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/models/service.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/api/api_services.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:flutter/material.dart';

class ServiceRepository {
  final APIService _api = APIService();

  Future<bool> getServices(BuildContext context, Category category) async {
    serviceProvider.isLoading = true;
    ResponseData responseData =
        await _api.get(context, 'service', params: category.toJson());
    serviceProvider.isLoading = false;
    if (responseData.hasError) return false;
    List<Service> services =
        Service().fromJsonList(responseData.data['data'] ?? "");
    serviceProvider.services = services;
    return true;
  }

  Future<bool> getMostBookedServices(BuildContext context) async {
    serviceProvider.isLoading = true;
    ResponseData responseData = await _api.get(context, 'service');
    serviceProvider.isLoading = false;
    if (responseData.hasError) return false;
    List<Service> services =
        Service().fromJsonList(responseData.data['data'] ?? "");
    serviceProvider.mostBookedServices = services;
    return true;
  }
}
