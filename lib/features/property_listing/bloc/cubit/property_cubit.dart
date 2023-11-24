import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_hub/core/networks/error_handler.dart';
import 'package:property_hub/features/property_listing/model/property.dart';
import 'package:property_hub/features/property_listing/repository/property_listing_repository.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final PropertyRepository propertyRepository;
  PropertyCubit({required this.propertyRepository}) : super(PropertyInitial());

  //CALLING LIST OF PROPERTIES
  Future<void> callAllProperties() async {
    emit(PropertyListLoading());
    try {
      var properties = await propertyRepository.fetchAllProperties();
      if (properties != []) {
        emit(PropertysListLoaded(properties: properties));
      }
    } on Failure catch (e) {
      emit(PropertyListFailure(message: e.toString()));
    }
  }
}
