import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_flutter/constants.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAccentColor,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: kPrimaryColor,
                    ),
                    backgroundColor: kTextColor,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Do Today',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: kTextColor,
                        ),
                      ),
                      SizedBox(width: 35),
                      FlatButton(
                        onPressed: (){
                            Provider.of<TaskData>(context).clearTasks();
                        },
                        color: Provider.of<TaskData>(context).tasks.length!=0? kSecondaryColor:kPrimaryColor,
                        child: Text(
                          'Clear All',
                          style: TextStyle(
                            fontSize: 15,
                            color: Provider.of<TaskData>(context).tasks.length!=0? kTextColor:kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    Provider.of<TaskData>(context).tasks.length != 0
                        ? ' ${Provider.of<TaskData>(context).tasks.length} Task'
                        : ' Add some tasks',
                    style: TextStyle(
                      fontSize: 18,
                      color: kTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
