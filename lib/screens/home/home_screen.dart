import 'package:dictionary_app/bloc/dictionary_cubit.dart';
import 'package:dictionary_app/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart ';

class HomeScreen extends StatelessWidget {
  getDictionaryFromWidget(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Dictionary App",
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search any word",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
              hintText: "Search a wrod",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearched();
                print("getWordSearched fatched");
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                  padding: const EdgeInsets.all(16)),
              child: Text(
                "Search",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    print("Ghurnijhor started");
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Center(child: Text(message, style: TextStyle(color: Colors.white)));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: cubit.state is WordSearchingState
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget("Some Error")
                  : cubit.state is NoWordSearchedState
                      ? getDictionaryFromWidget(context)
                      : Container()),
    );
  }
}
