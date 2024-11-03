import 'package:bloc_2/models/app_picture.dart';

abstract class ListState {
  List<AppPicture> list;
  ListState(this.list);
}

class LoadingListState extends ListState {
  LoadingListState() : super([]);
}

class UpdatedList extends ListState {
  @override
  List<AppPicture> list;
  UpdatedList({required this.list}) : super(list);
}
