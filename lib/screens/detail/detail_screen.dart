// import 'package:flutter/material.dart';
// import 'package:dictionary_app/model/word_response.dart';
//
// class DetailScreen extends StatelessWidget {
//   final WordResponse wordResponse;
//
//   const DetailScreen({required this.wordResponse});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       body: Container(
//         padding: const EdgeInsets.all(32),
//         width: double.infinity,
//         child: Column(
//           children: [
//             Text(
//               "${wordResponse.word}",
//               style: TextStyle(color: Colors.white, fontSize: 36),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//                 child: ListView.separated(
//                     itemBuilder: (context, index){
//                       final meaning = wordResponse.meanings[index];
//                       final definations = meaning.definitions;
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             meaning.partOfSpeech,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(height: 8,),
//                           ListView.separated(
//                               itemBuilder: (context, index) => Column(
//                                 children: [
//                                   Text("Defination : "+definations[index].definition ),
//                                   SizedBox(height: 4,),
//                                   Text("Scentence : ${definations[index].example}")
//                                 ],
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                               ),
//                               separatorBuilder: (context, index) => SizedBox(height: 16,),
//                               //{
//                               // final meaning = wordResponse.meanings[index];
//                               // final definations = meaning.definitions;
//                               // return Column(
//                               // crossAxisAlignment: CrossAxisAlignment.start,
//                               // children: [
//                               // Text(
//                               // meaning.partOfSpeech,
//                               // style: TextStyle(color: Colors.white),
//                               // ),
//                               // SizedBox(height: 8,),
//
//                       )
//                       ],
//                       );
//                     },
//                     separatorBuilder: separatorBuilder,
//                     itemCount: itemCount))
//           ],
//         ),
//       ),
//     );
//   }
// }
