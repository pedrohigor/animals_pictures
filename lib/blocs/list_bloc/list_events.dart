import 'package:bloc_2/models/app_picture.dart';

abstract class ListEvent {
  List<AppPicture> list;
  ListEvent(this.list);
}

class UpdateListEvent extends ListEvent {
  List<AppPicture> list = [];
  UpdateListEvent() : super([]);
}

class ShowListEvent extends ListEvent {
  List<AppPicture> list;
  ShowListEvent({required this.list}) : super(list);
}
