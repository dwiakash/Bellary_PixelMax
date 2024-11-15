import 'package:bellaryapp/models/city.dart';
import 'package:bellaryapp/models/response.dart';
import 'package:bellaryapp/providers/providers.dart';
import 'package:bellaryapp/services/api/api_services.dart';
import 'package:bellaryapp/utilities/extensions/response_extension.dart';
import 'package:bellaryapp/utilities/message.dart';
import 'package:flutter/material.dart';

class CityRepository {
  final APIService _api = APIService();

  Future<bool> getCities(BuildContext context) async {
    cityProvider.isGettingCities = true;
    ResponseData responseData = await _api.get(context, 'city');
    cityProvider.isGettingCities = false;
    if (responseData.hasError) return false;
    List<City> cities = City().fromJsonList(responseData.data['data'] ?? []);
    cityProvider.cities = cities;
    return true;
  }

  Future<bool> updateCity(BuildContext context, City city) async {
    cityProvider.isLoading = true;
    ResponseData responseData =
        await _api.post(context, 'profile/update-city', params: city.toJson());
    cityProvider.isLoading = false;
    if (responseData.hasError) return false;
    String message = responseData.data['message'] ?? '';
    showMessage(message);
    return true;
  }
}
