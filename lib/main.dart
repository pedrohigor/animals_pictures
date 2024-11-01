import 'package:bloc_2/blocs/list_bloc/list_bloc.dart';
import 'package:bloc_2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ListBloc>(create: (BuildContext context) => ListBloc())
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      )));
}
