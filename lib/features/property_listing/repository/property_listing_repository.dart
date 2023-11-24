// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:property_hub/core/networks/api.dart';
import 'package:property_hub/core/networks/error_handler.dart';
import 'package:property_hub/core/networks/logger.dart';
import 'package:property_hub/features/property_listing/model/property.dart';

class PropertyRepository {
  final ApiService api;
  PropertyRepository({
    required this.api,
  });

  //FETCH ALL PROPERTIES
  Future<List<Property>> fetchAllProperties() async {
    try {
      Response res = await api.dioInstance().get('properties');
      if (res.statusCode == 200) {
        logger.d('=====> ${res.data} =====>');

        List properties = res.data['data'];
        if (properties.isNotEmpty) {
          return properties.map((e) => Property.fromJson(e)).toList();
        } else {
          return [];
        }
      } else {
        throw Failure(res.data.toString());
      }
    } on DioException catch (e) {
      throw Failure(e.response?.data['message']);
    }
  }
}
