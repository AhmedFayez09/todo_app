import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/core/constant/my_colors.dart';
import 'package:todo_route/logic/firebase_firestore.dart';
import 'package:todo_route/logic/proviser.dart';
import 'package:todo_route/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.taskModel, {Key? key}) : super(key: key);

  TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<App_Provider>(context);
    return Slidable(
      startActionPane:
          ActionPane(extentRatio: .25, motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (c) {
            deleteFromFirevase(taskModel);
          },
          borderRadius: BorderRadius.circular(15),
          icon: Icons.delete,
          backgroundColor: Theme.of(context).colorScheme.error,
        )
      ]),
      child: Card(
        color: provider.themeMode == ThemeMode.light
            ? whiteColor
            : lightmainbackgroundDark,
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
                color:provider.isDone == false
            ? standeredColor
            : greenColor,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${taskModel.title}',
                      style: provider.isDone
                          ? Theme.of(context).textTheme.headline6
                          : Theme.of(context).textTheme.headline3),
                  Text(
                    taskModel.description,
                    style: Theme.of(context).textTheme.caption
                    
                    
                    // provider.isDone
                    //     ? Theme.of(context)
                    //         .textTheme
                    //         .headline6!
                    //         .copyWith(fontSize: 18)
                    //     : Theme.of(context).textTheme.subtitle1,caption
                  ),
                ],
              )),
              InkWell(
                onTap: () {
                  provider.isDoneTask();
                },
                child: provider.isDone
                    ? Text(
                        "Done! ",
                        style: Theme.of(context).textTheme.headline6,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: standeredColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
