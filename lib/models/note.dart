
class Note {
  String? id;
  final String title;
  final String content;
  final bool isArchived;
  final DateTime dateCreated;
  final DateTime dateUpdated;


  Note({
    this.id,
    required this.title, 
    required this.content,
    this.isArchived = false,
    DateTime? dateCreated,
    DateTime? dateUpdated
  }): dateCreated = dateCreated ?? DateTime.now(),
      dateUpdated = dateUpdated ?? DateTime.now();
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'isArchived': isArchived ? 1 : 0,
    'dateCreated': dateCreated.toIso8601String(),
    'dateUpdated': dateUpdated.toIso8601String()
  };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id:json['id'],
    title: json['title'],
    content: json['content'],
    isArchived: json['isArchived'] == 1,
    dateCreated: DateTime.parse(json['dateCreated']),
    dateUpdated: DateTime.parse(json['dateUpdated'])

  );

  Note copyWith({String? id, String? title, String? content, 
  bool? isArchived, DateTime? dateCreated, DateTime? dateUpdated}) 
  {
    return Note(id: id ?? this.id , 
            title: title ?? this.title, 
            content: content ?? this.content,
            isArchived: isArchived?? this.isArchived, 
            dateCreated: dateCreated ?? this.dateCreated,
            dateUpdated: dateUpdated ?? this.dateUpdated);
  }
}