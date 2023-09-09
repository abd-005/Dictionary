import 'package:dictionary_app/bloc/dictionary_cubit.dart';
import 'package:dictionary_app/repo/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        child:HomeScreen(),
        create: (context) => DictionaryCubit(WordRepository()),
      ),
    );
  }
}


