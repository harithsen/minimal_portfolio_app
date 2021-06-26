// import 'package:flutter/material.dart';
// import 'package:minimal_portfolio_webapp/data/shots.dart';

// class Designs extends StatelessWidget {
//   final List<Shots> dribbbleData;
//   const Designs({
//     Key key,
//     this.dribbbleData,
//   }) : super(key: key);

//   Shots newshot;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16),
//       width: 900,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 "Design",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline5
//                     .copyWith(fontSize: 16),
//               ),
//             ),
//             ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [Text(newshot[0].id.toString())],
//                   );
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
