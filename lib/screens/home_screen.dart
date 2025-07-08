
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_list_widget.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch(selectedIndex) {
      case 0:
        screen = NotesListWidget();
      default:
        screen = NotesListWidget();
    }
    return Scaffold(
      body: screen,
      bottomNavigationBar: 
        NavigationBar(
          backgroundColor: Colors.white,
          destinations: const <Widget> [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '',),
            NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search_sharp), label: ''),
            NavigationDestination(icon: Icon(Icons.edit_note_outlined), selectedIcon: Icon(Icons.edit_note_sharp), label: ''),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          } ,
          ),
    );
  }

}

