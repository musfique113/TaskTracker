import 'package:flutter/material.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/cancelled_task_screen.dart';
import 'package:taskmanager_ostad/ui/presentation/screens/completed_task_screen.dart';
import 'in_progress_task_screen.dart';
import 'new_task_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {

  int _setectedIndexScreen = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
    CompletedTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_setectedIndexScreen],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor:Colors.grey ,
        currentIndex: _setectedIndexScreen,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        onTap: (int index){
          _setectedIndexScreen = index;
          if(mounted){
            setState(() {

            });
          }
        },
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
