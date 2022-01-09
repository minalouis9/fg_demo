import 'dart:io';

import 'package:fg_demo/navigator/paths.dart';
import 'package:fg_demo/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.addNoteScreen);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final notes = ref.watch(notesProvider);
              if (notes.notesList.isEmpty) {
                return const Center(
                  child: Text('No Notes Available'),
                );
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: notes.notesList.length,
                  itemBuilder: (BuildContext context, int index) => Slidable(
                    key: UniqueKey(),
                    startActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            label: 'Edit',
                            backgroundColor: Colors.green,
                            icon: Icons.edit,
                            onPressed: (context) {
                              Navigator.pushNamed(
                                  context, RoutePaths.editNoteScreen,
                                  arguments: {
                                    'note': notes.notesList.elementAt(index),
                                    'index': index
                                  });
                            },
                            foregroundColor: Colors.white,
                          )
                        ]),
                    endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            label: 'Delete',
                            backgroundColor: Colors.red,
                            icon: Icons.delete_forever,
                            onPressed: (context) {
                              notes
                                  .removeNote(notes.notesList.elementAt(index));
                            },
                            foregroundColor: Colors.white,
                          )
                        ]),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ID: ${notes.notesList.elementAt(index).id.toString()}',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    notes.notesList.elementAt(index).title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(notes.notesList
                                      .elementAt(index)
                                      .description),
                                  const Divider(
                                    endIndent: 15.0,
                                  ),
                                  Text(
                                    notes.notesList.elementAt(index).date
                                        .replaceAll('T', '\n')
                                        .split('.')[0],
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    notes.notesList.elementAt(index).status
                                        ? 'Status: Open'
                                        : 'Status: Closed',
                                    style: const TextStyle(fontSize: 13.0),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: Container(
                                height: 150.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      image: FileImage(File(notes.notesList
                                          .elementAt(index)
                                          .picture)),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 5.0),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
