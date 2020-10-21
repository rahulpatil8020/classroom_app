import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, desc, correctAnswer, optionSelected;

  OptionTile({this.option, this.correctAnswer, this.desc, this.optionSelected});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.desc == widget.optionSelected
                        ? widget.optionSelected == widget.correctAnswer
                            ? Colors.green.withOpacity(0.7)
                            : Colors.red.withOpacity(0.7)
                        : Colors.grey,
                    width: 1.5),
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: Text(
              "${widget.option}",
              style: TextStyle(
                color: widget.optionSelected == widget.desc
                    ? widget.correctAnswer == widget.optionSelected
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.blue,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.desc,
            style: TextStyle(
              fontSize: 19,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class OptionTile extends StatefulWidget {
//   final String option, desc, correctAnswer, optionSelected;

//   OptionTile(
//       {this.desc, this.correctAnswer, this.option, this.optionSelected});

//   @override
//   _OptionTileState createState() => _OptionTileState();
// }

// class _OptionTileState extends State<OptionTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             height: 28,
//             width: 28,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 border: Border.all(
//                     color: widget.optionSelected == widget.desc
//                         ? widget.desc == widget.correctAnswer
//                             ? Colors.green.withOpacity(0.7)
//                             : Colors.red.withOpacity(0.7)
//                         : Colors.blue,
//                     width: 1.5),
//                 color: widget.optionSelected == widget.desc
//                     ? widget.desc == widget.correctAnswer
//                     ? Colors.green.withOpacity(0.7)
//                     : Colors.red.withOpacity(0.7)
//                     : Colors.white,
//               borderRadius: BorderRadius.circular(24)
//             ),
//             child: Text(
//               widget.option,
//               style: TextStyle(
//                 color: widget.optionSelected == widget.desc
//                     ? Colors.white
//                     : Colors.grey,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 8,
//           ),
//           Text(widget.desc, style: TextStyle(
//             fontSize: 17, color: Colors.blue,
//           ),)
//         ],
//       ),
//     );
//   }
// }

// class NoOfQuestionTile extends StatefulWidget {
//   final String text;
//   final int number;

//   NoOfQuestionTile({this.text, this.number});

//   @override
//   _NoOfQuestionTileState createState() => _NoOfQuestionTileState();
// }

// class _NoOfQuestionTileState extends State<NoOfQuestionTile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 3),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(14),
//                 bottomLeft: Radius.circular(14)
//               ),
//               color: Colors.blue
//             ),
//             child: Text(
//               "${widget.number}",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(14),
//                 bottomRight: Radius.circular(14),
//               ),
//               color: Colors.black54
//             ),
//             child: Text(
//               widget.text,
//               style: TextStyle(color: Colors.white),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
