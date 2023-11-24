import 'package:flutter/material.dart';
import 'package:property_hub/features/home/widgets/finances.dart';
import 'package:property_hub/features/home/widgets/report_screen.dart';
import 'package:property_hub/features/home/widgets/tenacies.dart';
import 'package:property_hub/features/property_listing/pages/property_listing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = [
    PropertyListingScreen(),
    ReportScreen(),
    Container(),
    FinanciesScreen(),
    TenanciesScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 28,
            ),
            label: "Dashboard",
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long_outlined,
                size: 28,
              ),
              label: "Reports"),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: IconButton(
                onPressed: () => _onItemTapped(3),
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.money_rounded,
                size: 28,
              ),
              label: "Finances"),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: "Tenancies"),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 12.0),
        showSelectedLabels: true,
        backgroundColor: const Color(0XFF3A59E4),
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
