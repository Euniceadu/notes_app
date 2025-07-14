class Note {
  String? id;
  final String title;
  final String content;
  final DateTime dateCreated;

  Note({
    this.id,
    required this.title, 
    required this.content,
    DateTime? dateCreated
    }) : dateCreated = dateCreated ?? DateTime.now();
  
}