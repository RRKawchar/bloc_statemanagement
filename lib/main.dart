import 'package:bloc_practice/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/favourite_app/favourite_bloc.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_practice/bloc/switch_slider/swich_slider_bloc.dart';
import 'package:bloc_practice/bloc/to_do/todo_bloc.dart';
import 'package:bloc_practice/repository/favourite_repository.dart';
import 'package:bloc_practice/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_practice/ui/to_do/to_do_screen.dart';
import 'package:bloc_practice/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (context) => SwitchSliderBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context)=> TodoBloc()),
        BlocProvider(create: (context)=> FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FavouriteAppScreen(),
      ),
    );
  }
}
