import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_route/models/task_model.dart';

CollectionReference<TaskModel> getDateFromFirebase() {
  return FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<TaskModel>(
    fromFirestore: (docSnapShot, _) {
      return TaskModel.fromJson(docSnapShot.data()!);
    },
    toFirestore: (task, _) {
      return task.toJson();
    },
  );
}

// ignore: non_constant_identifier_names
Future AddTaskToFireStore(TaskModel task) {
  var collectiom = getDateFromFirebase();
  var doc = collectiom.doc();
  task.id = doc.id;

return  doc.set(task);
}
