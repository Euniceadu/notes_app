
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/controllers/add_edit_note_controller.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/screens/add_edit_note_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {

    var noteList = context.watch<NoteProvider>().notes;

    var searchResults = noteList.where((element) {
      return element.title.toLowerCase().contains(searchQuery.toLowerCase()) || 
      element.content.toLowerCase().contains(searchQuery.toLowerCase());
    },).toList();

    return MaterialApp(
      title: '',
      home: Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search Notes...',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
          ),
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        )
      ),
      body: searchResults.isEmpty ? Center(child: Text('No notes Yet...'),):
      ListView(
        children: [
          for(var item in searchResults)
          Slidable(
            key: Key(item.id!),
            endActionPane: ActionPane(
              motion: BehindMotion(), 
              children: [
                SlidableAction(
                  icon: Icons.ios_share,
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  onPressed:(context) {
                    SharePlus.instance.share(
                      ShareParams(title: item.title, text: '${item.title}\n\n${item.content}')
                    );
                  },
                ),
                SlidableAction(
                  icon: Icons.archive_sharp,
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  onPressed:(context) {
                    
                  },
                ),
                SlidableAction(
                  icon: Icons.delete,
                  backgroundColor: Colors.redAccent,
                  foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  onPressed:(slidableContext) async {
                    final noteProvider = context.read<NoteProvider>();
                    final scaffoldMessenger = ScaffoldMessenger.of(slidableContext);

                    var confirmDelete = await showDialog<bool>(
                      context: context, 
                      builder:(dialogContext) => AlertDialog(
                        title: Text('Delete Note'),
                        content: Text('Are you sure you want to delete the note?'),
                        actions: [
                          TextButton(
                            onPressed:() {
                              Navigator.pop(dialogContext, false);
                            }, 
                            child: Text('Cancel')
                          ),
                          TextButton(
                            onPressed:() {
                              Navigator.pop(dialogContext, true);
                            }, 
                            child: Text('Delete')
                          ),
                          
                        ],
                      ),
                    );
                  
                    if(confirmDelete == true) {
                      noteProvider.deleteNote(item.id!);
                      scaffoldMessenger.showSnackBar(SnackBar(content: Text('Note deleted successfully')));
                    }

                  },
                )
              ]
            ),
            child: ListTile(
              title: Text(item.title),
              onTap: () {
                Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => AddEditNoteController(note: item),
                  child: AddEditNoteScreen()
                  ),
              )
            );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => AddEditNoteController(),
                child: AddEditNoteScreen()
                ),
            )
          );
        },
        child: const Icon(Icons.add_outlined),
        ),
    ),
    );
  }

}

