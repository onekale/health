import 'package:flutter/material.dart';
import 'ResultPage.dart';
import 'package:health/Calculate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
Color MaleColor =Color(0xFF1D1E33);
Color FemaleColor = Color(0xFF1D1E33);


Color IMbuttonColor = Color(0xFF111328);
Color AMbuttonColor = Color(0xFFEB1555);


void UpdateColor(int gender){
  if(gender == 1){
    //maleColor Changer
      if(MaleColor == AMbuttonColor){
        MaleColor = IMbuttonColor;
        FemaleColor = AMbuttonColor;
      }else{
        MaleColor = AMbuttonColor;
        FemaleColor = IMbuttonColor;
      }
  }
  //Female Color Changer
  if(gender == 2){
    if(FemaleColor == AMbuttonColor){
      FemaleColor = IMbuttonColor;
      MaleColor = AMbuttonColor;
    }else{
      FemaleColor = AMbuttonColor;
      MaleColor = IMbuttonColor;
    }
  }
}

class _InputPageState extends State<InputPage>{


  int height = 180;
  int weight = 60;
  int Age = 20;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMICalculator')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:
              GestureDetector(
                onTap: (){
                 setState(() {
                   UpdateColor(1);
                 });
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 60,
                      ),
                      Text('ወንድ', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: MaleColor,
                  ),
                  height: 200,
                  width: 150,
                ),
              )),
              Expanded(child:
              GestureDetector(
                onTap: (){
                  setState(() {
                    UpdateColor(2);
                  });
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 60,
                      ),
                      Text('ሴት', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: FemaleColor,
                  ),
                  height: 200,
                  width: 150,
                ),
              ))
            ],
          )),
          Expanded(child:
          Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ቁመት', style: TextStyle(fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                    ),
                    Text('ሴ.ሜ')
                  ],
                ),
                Slider(value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                activeColor: Color(0xFFEB1555),
                inactiveColor: Color(0xFF808E98),
                onChanged: (double newValue){
                setState(() {
                  height = newValue.round();
                });
                },
                )
              ],
            ),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF1D1E33),
            ),
            height: 200,
            width: 330,
          )),
          Expanded(child:  Row(
            children: <Widget>[
              Expanded(child:
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ክብደት'),
    Text(weight.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                    Row(
                      children: [

                        FloatingActionButton(
                            child: Text('-'),
                            onPressed: (){
                          setState(() {
                            weight--;
                          });
                        }),
                        Text('         '),
                        FloatingActionButton(
    child: Text('+'),onPressed: (){
                          setState(() {
                            weight++;
                          });
                        })
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF1D1E33),
                ),
                height: 200,
                width: 150,
              )),
              Expanded(child:
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('እድሜ'),
                    Text(Age.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        FloatingActionButton(
                            child: Text('-'),
                            onPressed: (){
                              setState(() {
                                Age--;
                              });
                            }),
                        Text('         '),
                        FloatingActionButton(
                            child: Text('+'),onPressed: (){
                          setState(() {
                            Age++;
                          });
                        })
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF1D1E33),
                ),
                height: 200,
                width: 150,
              ))
            ],
          )),
          GestureDetector(
            onTap: (){

              Calculate cal = Calculate(height: height,weight: weight);


              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
                bmiResult: cal.calculateBMI(),
                resultText: cal.getResult(),
                  interpretation: cal.getInterpretation(),
              ),
              ),
              );
            },
            child: Container(
              color: Color(0xFFEB1555),
              child: Center(child: Text('BMI አስላ',)),
              height: 50,
              width: double.infinity,
            ),
          )
        ],
      )
    );
  }
}
