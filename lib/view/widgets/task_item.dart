import 'package:flutter/material.dart';
import 'package:todo_route/core/constant/my_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        height: size.height * .08,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 3,
              color: standeredColor,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task Title',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Task Title',
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: standeredColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
