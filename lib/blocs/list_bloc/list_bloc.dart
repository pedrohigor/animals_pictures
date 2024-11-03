import 'package:bloc/bloc.dart';
import 'package:bloc_2/blocs/list_bloc/list_events.dart';
import 'package:bloc_2/blocs/list_bloc/list_states.dart';
import 'package:bloc_2/models/app_picture.dart';
import 'package:bloc_2/repositorys/api.dart';
import 'package:flutter/material.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ScrollController listScroll = ScrollController();
  List<AppPicture> list = [];
  ListBloc() : super(LoadingListState()) {
    listScroll.addListener(
      () async {
        if (listScroll.position.pixels >=
            listScroll.position.maxScrollExtent - 120) {
          list = list + await Api().listGenerate(await Api().randomConsult(20));

          add(UpdateListEvent(list));
        }
      },
    );
    Api().randomConsult(20).then(
      (value) {
        list = Api().listGenerate(value);
        add(UpdateListEvent(list));
      },
    );
    on<UpdateListEvent>((event, emit) => emit(UpdatedList(list: event.list)));
    ;
  }
}
