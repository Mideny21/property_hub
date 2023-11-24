part of 'property_cubit.dart';

sealed class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object> get props => [];
}

final class PropertyInitial extends PropertyState {}

// LOADING LIST OF INVOICE
class PropertyListLoading extends PropertyState {}

class PropertysListLoaded extends PropertyState {
  final List<Property> properties;
  const PropertysListLoaded({required this.properties});
  @override
  List<Object> get props => [properties];
}

class PropertyListFailure extends PropertyState {
  final String message;
  const PropertyListFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
