import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notepad/db/database.dart';
import 'package:my_notepad/model/note.dart';

class InputNote extends StatefulWidget {

  _InputNoteState createState() => _InputNoteState();
}

class _InputNoteState extends State<InputNote> {
  var inputTitle = TextEditingController();
  var inputDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              await DatabaseProvider.db.addNote(new Note(
                title: inputTitle.text,
                note: inputDescription.text,
              ));
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(
                fontSize: 32,
              ),
              controller: inputTitle,
              decoration: InputDecoration.collapsed(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: inputDescription,
              decoration: InputDecoration.collapsed(hintText: 'note'),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
