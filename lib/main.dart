import 'package:ayah2/ToDoCubit/todo_cubit.dart';
import 'package:ayah2/todo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(MaterialApp(
  home: BlocProvider(
    create: (BuildContext context) => ToDoCubit(),
    child: TodoAppWithoutStateManagement(),
  ),
  theme: ThemeData(primarySwatch: Colors.teal),
));