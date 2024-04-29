import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/list_service.dart';
import '../models/task.dart';
import '../models/task_list.dart';
import '../models/user_lists.dart';
import '../utilities/constants.dart';

// ignore: must_be_immutable
class AddTaskDialog extends StatelessWidget {
  TaskList selectedTaskList;

  AddTaskDialog({super.key, required this.selectedTaskList});

  @override
  Widget build(BuildContext context) {
    Task? newTask;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: ListService().allLists(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong.");
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<TaskList> userLists = UserLists.fromQuerySnapshot(snapshot);
          List<DropdownMenuEntry> customDropdownEntries = userLists
              .map((taskList) =>
                  DropdownMenuEntry(value: taskList.id, label: taskList.name))
              .toList();

          return Container(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: DropdownMenu(
                      initialSelection: selectedTaskList.id,
                      dropdownMenuEntries: customDropdownEntries,
                      onSelected: (value) {
                        selectedTaskList = userLists
                            .where((taskList) => taskList.id == value)
                            .first;
                      },
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15),
                      leadingIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      width: MediaQuery.of(context).size.width * 0.6,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                  kSpacing,
                  kSpacing,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: 'To Do'),
                      onChanged: (input) {
                        newTask = Task(
                          listId: selectedTaskList.id,
                          name: input,
                        );
                      },
                    ),
                  ),
                  kSpacing,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 135.0,
                        child: TextButton(
                          child: Text(
                            'CANCEL',
                            style: kdialogActionTextStyle,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 135.0,
                        child: TextButton(
                          child: Text(
                            'ADD',
                            style: kdialogActionTextStyle,
                          ),
                          onPressed: () {
                            if (newTask != null) {
                              selectedTaskList.addTask(newTask!);
                              ListService()
                                  .updateTaskListMetadata(selectedTaskList);
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}