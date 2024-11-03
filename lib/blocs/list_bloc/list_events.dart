import 'package:bloc_2/models/app_picture.dart';

abstract class ListEvent {
  List<AppPicture> list;
  ListEvent(this.list);
}

class UpdateListEvent extends ListEvent {
  @override
  // TODO: implement list
  List<AppPicture> list;
  UpdateListEvent(this.list) : super(list);
}
