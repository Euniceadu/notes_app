import 'package:flutter/material.dart';

class AddNoteWidget  extends StatelessWidget {
  const AddNoteWidget({super.key});


  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Title'
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your note...'
                ),
              )
            )
          ],
        ),
      ); 
  }

}