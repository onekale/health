import 'dart:math';
import 'package:health/Input_Page.dart';
class Calculate{

  Calculate({required this.height, required this.weight});

  final int height;
  final int weight;


  double _bmi = 0;

  String calculateBMI(){

     _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }

  String getResult(){
    if(_bmi>= 25){
      return 'ወፍራም ኖት 😁';
    }else if(_bmi>18.5) {
      return 'መጠንኛ 💪';
    }else {
      return 'ቀጭን ኖት 😔';

    }
  }

  String getInterpretation(){
    if(_bmi>= 25){
      return 'ከተገቢው የሰውነት መጠን በላይ ስለወፈሩ። እባክዎ እንቅስቃሴ ያዘውትሩ!';
    }else if(_bmi>18.5) {
      return 'በጣም ጥሩ ተገቢ የሆን የሰውነት መጠን ላይ ኖት።በርቱልን! 💪';
    }else {
      return 'ከተገቢው የሰውነት መጠን በታች ስለከሱ። እባክዎን 🤲 ምገብ በአግባቡ ይመገቡ!';
    }
  }
  }
