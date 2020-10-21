import 'package:classroom/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final int correct, incorrect, total;
  Results(this.correct, this.incorrect, this.total);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.correct}/${widget.total}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "  Correct = ${widget.correct} \nIncorrect = ${widget.incorrect} \n",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: customButton(context, "Go to Home",
                    MediaQuery.of(context).size.width / 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
