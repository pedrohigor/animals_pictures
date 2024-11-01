import 'package:bloc_2/models/app_picture.dart';

abstract class ListState {
  List<AppPicture> list;
  ListState(this.list);
}

class LoadingListState extends ListState {
  List<AppPicture> list = [];
  LoadingListState() : super([]);
}

class UpdatedList extends ListState {
  List<AppPicture> list;
  UpdatedList({required this.list}) : super(list);
}
