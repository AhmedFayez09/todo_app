import 'package:flutter/material.dart';
import 'package:todo_route/core/shared/coomponant/componant.dart';
import 'package:todo_route/models/task_model.dart';
import '../../logic/firebase_firestore.dart';

var formkey = GlobalKey<FormState>();

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  String title = '';
  String desc = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add new Task',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: size.height * .03),
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (text) {
                    title = text;
                  },
                  style: Theme.of(context).textTheme.subtitle2,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Task Title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your task',
                    hintStyle: Theme.of(context).textTheme.headline5,
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    desc = text;
                  },
                  style: Theme.of(context).textTheme.subtitle2,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Task Description';
                    }
                    return null;
                  },
                  maxLines: 4,
                  minLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Descraption',
                    hintStyle: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * .03),
          Text(
            'Selected Time',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: size.height * .01),
          InkWell(
            onTap: () {
              openDataPicker();
            },
            child: Text(
              '${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: size.height * .04),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            onPressed: () {
              if (formkey.currentState!.validate()) {
                TaskModel task = TaskModel(
                  title: title,
                  description: desc,
                  selectedDate: selectedDate.microsecondsSinceEpoch,
                );
                AddTaskToFireStore(task).then((value) {
                  showLoading(context, 'Loading....');
                  hideBottomSheet(context);
                  showMessage(
                    context,
                    'Successfully Added',
                    'OK',
                    () {
                      hideBottomSheet(context);
                       
                    },
                  );

                  
                }).catchError((error) {
                  print(error);
                });
              }
            },
            child: const Text(
              'Add Task',
            ),
          ),
        ],
      ),
    );
  }

  openDataPicker() async {
    var choosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (choosenDate != null) selectedDate = choosenDate;
    setState(() {});
  }
}
