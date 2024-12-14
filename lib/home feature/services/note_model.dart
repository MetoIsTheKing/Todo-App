class Note {
  final int id;
  final String createdAt;
  final String content;
  final String color;
  final String category;
  final int priority;
  final bool completed;

  Note(
      {required this.id,
      required this.createdAt,
      required this.content,
      required this.color,
      required this.category,
      required this.priority,
      required this.completed});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        id: json['id'] as int,
        createdAt: json['created_at'] as String,
        content: json['content'] as String,
        color: json['color'] as String,
        category: json['category'] as String,
        priority: json['priority'] as int,
        completed: json['completed'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'content': content,
      'color': color,
      'category': category,
      'priority': priority,
      'completed': completed
    };
  }
}
