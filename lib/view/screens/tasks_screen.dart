import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_route/core/constant/my_colors.dart';

import '../widgets/task_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate:DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.blueGrey,
            activeDayColor: standeredColor,
            activeBackgroundDayColor: whiteColor,
            dotsColor: standeredColor,
            selectableDayPredicate: (date) => true,
            // date.day != 23,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              
              itemBuilder: (c,i){
              return TaskItem();
            }),
          )
        ],
      ),
    );
  }
}
