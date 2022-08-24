import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/core/constant/my_colors.dart';
import 'package:todo_route/logic/firebase_firestore.dart';
import 'package:todo_route/models/task_model.dart';
import '../../logic/proviser.dart';
import '../widgets/task_item.dart';

// ignore: must_be_immutable
class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<App_Provider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            // ignore: avoid_print
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.blueGrey,
            activeDayColor: standeredColor,
            activeBackgroundDayColor: provider.themeMode == ThemeMode.light
                ? whiteColor
                : lightmainbackgroundDark,
            dotsColor: standeredColor,
            selectableDayPredicate: (date) => true,
            // date.day != 23,
            locale: 'en_ISO',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: GetTaskFromFirebseFireStoreUseingStreeming(selectedDate),
              builder: (c, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapShot.hasError) {
                  return const Text('SomeThing went wrong');
                }
//make this in provider
                List<TaskModel> Tasks =
                    snapShot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                    itemCount: Tasks.length,
                    itemBuilder: (c, i) {
                      return TaskItem(Tasks[i]);
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
