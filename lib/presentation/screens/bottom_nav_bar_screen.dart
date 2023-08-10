import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/presentation/screens/cancelled_task_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/completed_task_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/in_progress_task_screen.dart';
import 'package:taskmanager_ostad/presentation/screens/new_task_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CanceledTaskScreen(),
    CompletedTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        color: Colors.green,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.green,
        height: 50,
        items: const <Widget>[
          Icon(
            Icons.list_alt,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.access_time_rounded, size: 30, color: Colors.white),
          Icon(Icons.cancel_outlined, size: 30, color: Colors.white),
          Icon(Icons.check_circle_outlined, size: 30, color: Colors.white),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

/*
class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CanceledTaskScreen(),
    CompletedTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    print(_selectedScreenIndex);
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
            color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        onTap: (int index) {
          _selectedScreenIndex = index;
          print(_selectedScreenIndex);
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded), label: 'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined), label: 'Cancel'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Completed'),
        ],
      ),
    );
  }
}
*/
