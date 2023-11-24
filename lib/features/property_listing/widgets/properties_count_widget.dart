import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_hub/features/property_listing/bloc/cubit/property_cubit.dart';

class PropertiesCount extends StatelessWidget {
  final String type;
  const PropertiesCount({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: MediaQuery.of(context).size.width * 0.08,
      decoration: BoxDecoration(
          color: Color(0xff8697E7), borderRadius: BorderRadius.circular(8)),
      child: BlocBuilder<PropertyCubit, PropertyState>(
        builder: (context, state) {
          if (state is PropertyListLoading) {
            return Center(
              child: SizedBox(
                  height: 5,
                  width: 5,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
            );
          } else if (state is PropertysListLoaded) {
            var occupied =
                state.properties.where((element) => element.type == 'occupied');
            var vacant =
                state.properties.where((element) => element.type == 'vacant');
            return Center(
              child: Text(
                type == 'all'
                    ? state.properties.length.toString()
                    : type == 'vacant'
                        ? vacant.length.toString()
                        : type == 'occupied'
                            ? occupied.length.toString()
                            : '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
