import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_hub/features/property_listing/bloc/cubit/property_cubit.dart';
import 'package:property_hub/features/property_listing/model/property.dart';
import 'package:property_hub/features/property_listing/widgets/property_card_details.dart';

class OccupiedProperties extends StatefulWidget {
  const OccupiedProperties({super.key});

  @override
  State<OccupiedProperties> createState() => _OccupiedPropertiestate();
}

class _OccupiedPropertiestate extends State<OccupiedProperties> {
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
            var occupied =
                state.properties.where((element) => element.type == 'occupied');
            return ListView.builder(
              itemCount: occupied.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Property property = occupied.elementAt(index);
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
