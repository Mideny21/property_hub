// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:property_hub/features/property_listing/model/property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  const PropertyCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0XFFF0F3F9), borderRadius: BorderRadius.circular(20)),
        height: 180,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/smart.jpg',
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    height: 130,
                  )),
              SizedBox(width: 20),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.name ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      property.city ?? '',
                      style: TextStyle(
                          color: Color(0xff4E5E7B),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          color: property.type == 'vacant'
                              ? Color(0xffEAD8D8)
                              : Color(0xffD9EAD8),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          property.type ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: property.type == 'vacant'
                                  ? Color(0xffD78787)
                                  : Color(0xff28BE1A),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${property.income}' ?? '',
                          style: TextStyle(
                              color: Color(0xff0B1461),
                              fontSize: 15,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        Text(
                          '\$${property.expenses}' ?? '',
                          style: TextStyle(
                              color: Color(0xff0B1461),
                              fontSize: 15,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Income',
                          style: TextStyle(
                              color: Color(0xff4E5E7B),
                              fontSize: 15,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(
                          'Expenses',
                          style: TextStyle(
                              color: Color(0xff4E5E7B),
                              fontSize: 15,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
