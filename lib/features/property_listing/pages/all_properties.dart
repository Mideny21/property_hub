import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_hub/features/property_listing/bloc/cubit/property_cubit.dart';
import 'package:property_hub/features/property_listing/model/property.dart';
import 'package:property_hub/features/property_listing/widgets/property_card_details.dart';

class AllProperties extends StatefulWidget {
  const AllProperties({super.key});

  @override
  State<AllProperties> createState() => _AllPropertiestate();
}

class _AllPropertiestate extends State<AllProperties> {
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
            return ListView.builder(
              itemCount: state.properties.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Property property = state.properties[index];

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
