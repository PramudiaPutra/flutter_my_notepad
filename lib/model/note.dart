class Note {
  int id;
  String title;
  String note;

  Note({
    this.id,
    this.title,
    this.note,
  });

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
    id: json['id'],
    title: json['title'],
    note: json['note'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
    };
  }
}
