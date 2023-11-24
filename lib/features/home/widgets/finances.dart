import 'package:flutter/material.dart';

class FinanciesScreen extends StatefulWidget {
  const FinanciesScreen({super.key});

  @override
  State<FinanciesScreen> createState() => _FinanciesScreenState();
}

class _FinanciesScreenState extends State<FinanciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Financies Screen'),
    );
  }
}
