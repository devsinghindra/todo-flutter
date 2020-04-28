import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
//  final Function addTaskCallback;
//  AddTaskScreen({this.addTaskCallback});
  @override
  Widget build(BuildContext context) {
    String newTitle;
    return SafeArea(
      child: Container(
        color: Color(0xff75321C),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 25,
                ),
              ),
              TextField(
                autofocus: true,
                style: TextStyle(
                  color: kTextColor,
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              FlatButton(
                color: kSecondaryColor,
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context).addTask(newTitle);
                  Navigator.pop(context);
//                    print(Provider.of<TaskData>(context).taskCount);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
