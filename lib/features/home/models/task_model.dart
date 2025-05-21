import 'package:hive/hive.dart';
part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel extends HiveObject {
@HiveField(0)
  final String title;
@HiveField(1)

  final String dec;
@HiveField(2)

 final String time;
  TaskModel({required this.dec, required this.time, required this.title});
}
