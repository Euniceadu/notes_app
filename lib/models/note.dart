class Note {
  int? id;
  final String title;
  final String content;
  final DateTime dateCreated;

  Note({
    this.id,
    required this.title, 
    required this.content,
    DateTime? dateCreated
    }) : dateCreated = dateCreated ?? DateTime.now();

  Note copyWith({
    int? id, 
    String? title,
    String? content,
    DateTime? dateCreated,
  }) {
    return Note(
      id: id ?? this.id, 
      title: title ?? this.title, 
      content: content ?? this.content,
      dateCreated: dateCreated ?? this.dateCreated
    );
  }
  
}