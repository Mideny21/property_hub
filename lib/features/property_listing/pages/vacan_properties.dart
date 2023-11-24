import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_hub/core/networks/logger.dart';
import 'package:property_hub/features/property_listing/bloc/cubit/property_cubit.dart';
import 'package:property_hub/features/property_listing/model/property.dart';
import 'package:property_hub/features/property_listing/widgets/property_card_details.dart';

class VacantProperties extends StatefulWidget {
  const VacantProperties({super.key});

  @override
  State<VacantProperties> createState() => _VacantPropertiestate();
}

class _VacantPropertiestate extends State<VacantProperties> {
  @override
  void initState() {
    BlocProvider.of<PropertyCubit>(context).callAllProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PropertyCubit, PropertyState>(
        builder: (context, state) {
          if (state is PropertyListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PropertysListLoaded) {
            Iterable<Property> vacant =
                state.properties.where((element) => element.type == 'vacant');
            return ListView.builder(
              itemCount: vacant.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Property property = vacant.elementAt(index);

                return PropertyCard(property: property);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
