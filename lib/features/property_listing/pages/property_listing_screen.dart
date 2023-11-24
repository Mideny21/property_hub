// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_hub/features/property_listing/bloc/cubit/property_cubit.dart';

import 'package:property_hub/features/property_listing/pages/all_properties.dart';
import 'package:property_hub/features/property_listing/pages/occupied_properties.dart';
import 'package:property_hub/features/property_listing/pages/vacan_properties.dart';
import 'package:property_hub/features/property_listing/widgets/properties_count_widget.dart';
import 'package:property_hub/features/property_listing/widgets/user_avatar.dart';

class PropertyListingScreen extends StatefulWidget {
  const PropertyListingScreen({super.key});

  @override
  State<PropertyListingScreen> createState() => _PropertyListingScreenState();
}

class _PropertyListingScreenState extends State<PropertyListingScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: _activeIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _activeIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 105,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.grey)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.tune_outlined, color: Colors.white)),
            const UserAvatar(),
          ],
          backgroundColor: const Color(0XFF3A59E4),
          bottom: PreferredSize(
            preferredSize: const Size(0, 50),
            child: ColoredBox(
              color: const Color(0XFF3A59E4),
              child: Column(
                children: [
                  const Text(
                    "Properties",
                    style: TextStyle(
                        color: Colors.white, fontSize: 24, letterSpacing: 0.8),
                  ),
                  const SizedBox(height: 10),
                  TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    indicatorColor: Colors.white,
                    onTap: (tabIndex) {
                      setState(() {
                        _activeIndex = tabIndex;
                      });
                    },
                    tabs: const [
                      Tab(
                        child: Row(children: [
                          Text("All"),
                          SizedBox(
                            width: 5,
                          ),
                          PropertiesCount(
                            type: 'all',
                          )
                        ]),
                      ),
                      Tab(
                        child: Row(children: [
                          Text("Occupied"),
                          SizedBox(
                            width: 5,
                          ),
                          PropertiesCount(type: 'occupied')
                        ]),
                      ),
                      Tab(
                        child: Row(children: [
                          Text("Vacant"),
                          SizedBox(
                            width: 7,
                          ),
                          PropertiesCount(type: 'vacant')
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            AllProperties(),
            OccupiedProperties(),
            VacantProperties(),
          ],
        ),
      ),
    );
  }
}
