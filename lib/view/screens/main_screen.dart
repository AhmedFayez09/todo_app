import 'package:flutter/material.dart';
import 'package:todo_route/core/constant/my_colors.dart';
import 'package:todo_route/view/screens/settings_screen.dart';
import 'package:todo_route/view/screens/tasks_screen.dart';
import '../widgets/add_task_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    const TasksScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0), // here the desired height
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text(
            "ToDo",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
          color: whiteColor,
          width: 1,
        )),
        onPressed: () {
          openBottomSheetToAddTask();
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 30,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  label: ''),
            ],
          ),
        ),
      ),
    );
  }

  openBottomSheetToAddTask() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        context: context,
        builder: (c) {
          return Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewInsets.top,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskBottomSheet());
        },
        isScrollControlled: true);
  }
}

class BackGroundScreen extends StatelessWidget {
  const BackGroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
      ],
    );
  }
}
