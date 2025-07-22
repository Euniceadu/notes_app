class Note {
  String? id;
  final String title;
  final String content;
  final DateTime dateCreated;
  final DateTime dateUpdated;


  Note({
    this.id,
    required this.title, 
    required this.content,
    DateTime? dateCreated,
    DateTime? dateUpdated
  }): dateCreated = dateCreated ?? DateTime.now(),
      dateUpdated = dateUpdated ?? DateTime.now();
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'dateCreated': dateCreated.toIso8601String(),
    'dateUpdated': dateUpdated.toIso8601String()
  };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id:json['id'],
    title: json['title'],
    content: json['content'],
    dateCreated: DateTime.parse(json['dateCreated']),
    dateUpdated: DateTime.parse(json['dateUpdated'])

    );
}