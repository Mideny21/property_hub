import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:property_hub/core/networks/api.dart';
import 'package:property_hub/core/networks/logger.dart';
import 'package:property_hub/core/networks/network_logger.dart';
import 'package:property_hub/features/property_listing/bloc/cubit/property_cubit.dart';
import 'package:property_hub/features/property_listing/repository/property_listing_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // NETWORKS
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(ApiService());
  getIt.registerSingleton(SimpleLogPrinter());
  getIt.registerSingleton(Logging());

  // PROPERTY
  getIt.registerLazySingleton(
      () => PropertyRepository(api: getIt.get<ApiService>()));

  getIt.registerFactory<PropertyCubit>(
      () => PropertyCubit(propertyRepository: getIt.get<PropertyRepository>()));
}
