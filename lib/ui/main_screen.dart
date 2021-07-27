import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notepad/ui/input_screen.dart';

class MainScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notepad'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListNote(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InputNote();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListNote extends StatefulWidget {
  @override
  _ListNoteState createState() => _ListNoteState();
}

class _ListNoteState extends State<ListNote> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'aaaa',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  text:
                                      'Apple Color Emoji'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      padding: EdgeInsets.only(bottom: 56),
    );
  }
}
