class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '1', todoText: 'Beli Buku', isDone: true),
      ToDo(id: '2', todoText: 'Masak', isDone: true),
      ToDo(id: '3', todoText: 'Belanja',),
      ToDo(id: '4', todoText: 'Belajar', ),
      ToDo(id: '5', todoText: 'Cuci Piring',),
      ToDo(id: '6', todoText: 'Ke rumah nenek',),
      ToDo(id: '7', todoText: 'Kasih makan kucing',),
    ];
  }

}