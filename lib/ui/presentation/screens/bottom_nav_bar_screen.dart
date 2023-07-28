import 'package:flutter/material.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor:Colors.grey ,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded),label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outlined), label: "Cancle"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined),label: "Completed"),
        ],
      ),
    );
  }
}
