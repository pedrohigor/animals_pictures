import 'package:bloc_2/blocs/list_bloc/list_bloc.dart';
import 'package:bloc_2/blocs/list_bloc/list_events.dart';
import 'package:bloc_2/blocs/list_bloc/list_states.dart';
import 'package:bloc_2/repositorys/api.dart';
import 'package:bloc_2/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListBloc blocList = BlocProvider.of<ListBloc>(context);
    return Scaffold(
      body: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
        return RefreshIndicator(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    itemCount:
                        state is LoadingListState ? 10 : state.list.length,
                    controller: blocList.listScroll,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, indx) {
                      return Padding(
                          padding: const EdgeInsets.all(1),
                          child: state is LoadingListState
                              ? Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 250,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                        Color.fromARGB(255, 223, 223, 223),
                                        Color.fromARGB(255, 211, 211, 211),
                                        Color.fromARGB(255, 223, 223, 223),
                                      ])),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                picture: state.list[indx])));
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 250,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          Color.fromARGB(255, 223, 223, 223),
                                          Color.fromARGB(255, 211, 211, 211),
                                          Color.fromARGB(255, 223, 223, 223),
                                        ])),
                                    child: Image.network(
                                      state.list[indx].url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ));
                    })),
            onRefresh: () async {
              return Api().randomConsult(20).then((v) {
                blocList.list = Api().listGenerate(v);
                blocList.add(UpdateListEvent(blocList.list));
              });
            });
      }),
    );
  }
}
