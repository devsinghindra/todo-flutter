import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';

class TaskTile extends StatelessWidget{
  final bool isChecked ;
  final String taskTitle;
  final Function checkBoxStateCallback;
  final Function longPressCallback;
  TaskTile({this.isChecked,this.taskTitle,this.checkBoxStateCallback,this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          color: kTextColor,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: longPressCallback,
      ),
      leading:Checkbox(
        value: isChecked,
        activeColor: kAccentColor,
        onChanged: checkBoxStateCallback,
      ),
    );
  }
}
