import 'gerencia_de_estado.dart';
import '../shared/models/todo_item.dart';

class HomeController extends GerenciaDeEstado<List<ToDoItem>> {
  final List<ToDoItem> _toDoItemList;
  final _doneItemList = <ToDoItem>[];

  HomeController(this._toDoItemList) : super(_toDoItemList);

  List<ToDoItem> get toDoItemList => _toDoItemList;
  List<ToDoItem> get doneItemList => _doneItemList;

  void onAddItem(String itemTitle) {
    _toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
    modify(_toDoItemList);
  }

  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);
    _toDoItemList.add(
      ToDoItem(
        title: item.title,
      ),
    );
    modify(_toDoItemList);
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
    modify(_toDoItemList);
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);
    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
    modify(_toDoItemList);
  }
}
