import 'package:flutter/material.dart';
import 'package:health/Input_Page.dart';
import 'package:health/Calculate.dart';



class ResultPage extends StatelessWidget{

  ResultPage({ required this.bmiResult, required this.resultText, required this.interpretation } );

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            child: Text('ውጤትዎ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),),
          Expanded(
              flex: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF1D1E33),
              ),
              height: 200,
              width: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: TextStyle(color: Colors.green, fontSize: 35),
                  ),
                  Text(bmiResult, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(interpretation, style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> InputPage()));
            },
            child: Container(
              color: Color(0xFFEB1555),
              child: Center(child: Text('Recalculate'),),
              height: 50,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}

