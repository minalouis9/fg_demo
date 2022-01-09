import 'dart:io';

import 'package:fg_demo/helpers/helpers_index.dart';
import 'package:fg_demo/models/notes.dart';
import 'package:fg_demo/navigator/paths.dart';
import 'package:fg_demo/providers/notes_provider.dart';
import 'package:fg_demo/widgets/widgets_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController(),
      _titleController = TextEditingController(),
      _descriptionController = TextEditingController(),
      _dateController = TextEditingController();
  bool _status = false, _saving = false;
  late DateTime _dateTime;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Note"),
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final notes = ref.watch(notesProvider);
              return IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _saving = true;
                    });
                    notes.addNotes(NotesModel(
                        id: int.parse(_idController.text),
                        title: _titleController.text,
                        picture: image!,
                        description: _descriptionController.text,
                        date: _dateTime.toIso8601String(),
                        status: _status));
                    setState(() {
                      _saving = false;
                    });
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                              title: const Text(
                                'Note added',
                                textAlign: TextAlign.center,
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RoutePaths.homeScreen,
                                        (route) => false);
                                  },
                                  child: const Text('Confirm'),
                                )
                              ],
                            ));
                  }
                },
                icon: const Icon(Icons.done),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: _saving
              ? const CircularProgressIndicator()
              : Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 5.0),
                      CTextFiledForm(
                        fieldController: _idController,
                        label: 'ID',
                      ),
                      const SizedBox(height: 15.0),
                      CTextFiledForm(
                        fieldController: _titleController,
                        label: 'Title',
                      ),
                      const SizedBox(height: 15.0),
                      CTextFiledForm(
                        fieldController: _descriptionController,
                        label: 'Description',
                        maxLines: 5,
                      ),
                      const SizedBox(height: 15.0),
                      CTextFiledForm(
                        fieldController: _dateController,
                        label: 'Date',
                        readOnly: true,
                        suffixIcon: IconButton(
                            onPressed: () {
                              DatePicker.showDateTimePicker(context,
                                  onConfirm: (DateTime value) {
                                setState(() {
                                  _dateTime = value;
                                  _dateController.text = value
                                      .toIso8601String()
                                      .replaceAll('T', '\n')
                                      .split('.')[0];
                                });
                              });
                            },
                            icon: const Icon(Icons.date_range_outlined)),
                      ),
                      const SizedBox(height: 15.0),
                      CheckboxListTile(
                          title: const Text('Status'),
                          subtitle: Text(_status ? 'Open' : 'Closed'),
                          value: _status,
                          onChanged: (value) {
                            setState(() {
                              _status = value!;
                            });
                          }),
                      const SizedBox(height: 15.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(55.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          image = await ImagePickerHelper
                                                  .cameraImagePicker()
                                              .whenComplete(() {
                                            setState(() {});
                                            Navigator.pop(context);
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.add_a_photo_outlined),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          image = await ImagePickerHelper
                                                  .galleryImagePicker()
                                              .whenComplete(() {
                                            setState(() {});
                                            Navigator.pop(context);
                                          });
                                        },
                                        icon: const Icon(Icons.image_outlined),
                                      ),
                                    ],
                                  ),
                                );
                              }).whenComplete(() {});
                        },
                        child: const Text('Pick Image'),
                      ),
                      const SizedBox(height: 15.0),
                      if (image != null)
                        Container(
                          height: 250.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: FileImage(File(image!)),
                                fit: BoxFit.cover),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
