import 'package:dictionary_app/model/word_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/word_repo.dart';

class DictionaryCubit extends Cubit<DictionaryState>{
  final WordRepository _repository;

  DictionaryCubit(this._repository) : super(NoWordSearchedState());

  final queryController = TextEditingController();

  Future getWordSearched() async{
    emit(WordSearchingState());
    print("WordSearchingState() fatched");

    try {
      final words = await _repository.getWordsFromDictionary(queryController.text);

      // ignore: unnecessary_null_comparison
      if(words == null){
        emit(ErrorState("There is some issue."));
      }else{
        print(words.toString());
        emit(WordSearchedState(words));
        NoWordSearchedState();
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }

}
abstract class DictionaryState {

}

class NoWordSearchedState extends DictionaryState{

}
class WordSearchingState extends DictionaryState{


}

class WordSearchedState extends DictionaryState{
  final List<WordResponse> words;
  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState{
  final message;


  ErrorState(this.message);
}