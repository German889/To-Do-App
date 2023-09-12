class Task {
  late String _title;
  late DateTime _dueDate;
  late bool _isDone;

  Task(this._title, this._dueDate, this._isDone);

  //getter для получения названия задачи
  String get title => _title;
  //setter для установки статуса задачи
  set isDone(bool value) {
    _isDone = value;
  }

  //фабричный метод для создания задачи с текущей датой
  factory Task.withCurrentDate(String title) {
    return Task(title, DateTime.now(), false);
  }

  //TODO методы для форматирования даты

  //переопределение методов equals и hashcode для сравнения объектов
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          _title == other._title &&
          _dueDate == other._dueDate &&
          _isDone == other._isDone;

  @override
  int get hashCode => _title.hashCode ^ _dueDate.hashCode ^ _isDone.hashCode;
}
