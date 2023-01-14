import 'package:flutter/cupertino.dart';

import '../calc_service/calc_service.dart';

class CalcProvider extends ChangeNotifier{
   List<String> display = [];
   List<String> display2 = [];

   List<String> displayAnswers = [];
   String operands = 'x+/-';
   String op1_s = '';
   late int op1 ;
   String op2_s  = '';
   late int op2;
   bool flag = false;
   String operand = '';
   CalcService _calcService = CalcService();

   // List <String> buttonValues = ['C' ,'/', 'x','Q','7','8','9','-','4','5','6','+',"1",'2','3','2','1','0','.','='];

  CalcProvider(){

  }


  setDisplay(String value){
    if(value == 'C'){
      print('clear');
      display = [];
      display2 = [];
      displayAnswers=[];
      op2_s ='';
      op1_s ='';
      flag = false;
      operand = '';
      notifyListeners();
    }else if(value == 'Q'){
      int index = 1;
      if(index < display2.length){
        display2.removeLast();
        index++;
      }else{
        index = 1;
        while(index< display.length){
          display.removeLast();
          index++;
        }
      }

      notifyListeners();
    }else if(operands.contains(value) && flag == false){
      operand = value;
      display.forEach((element) {
        print(' iss $op1_s');
        print(element);
        op1_s=op1_s+element;
      });
      print('op1 issssssssss $op1_s');
      flag = true;
      display.add(value);
      notifyListeners();
    }else if(value == '='){
      display2.forEach((element) {
        op2_s = op2_s+element;
      });
      print('op2 issssssssss $op2_s');

      displayAnswer();
      notifyListeners();
    }
    else{
      if(flag == false){
        display.add(value);
        notifyListeners();
      }else{
        display2.add(value);
        display.add(value);

        notifyListeners();
      }

    }

  }
  void displayAnswer(){
    op1 = int.parse(op1_s);
    op2 = int.parse(op2_s);
      if(operand == 'x'){
        displayAnswers.add(_calcService.multiply(op1,op2).toString());
        notifyListeners();
      }else if (operand == '-'){
        displayAnswers.add(_calcService.subtract(op1,op2).toString());
        notifyListeners();
      }else if(operand == '+'){
        displayAnswers.add(_calcService.add(op1,op2).toString());
        notifyListeners();
      }else if (operand == "/"){
        displayAnswers.add(_calcService.divide(op1,op2).toString());
        notifyListeners();
      }else {
        displayAnswers.add(_calcService.modulo(op1,op2).toString());
        notifyListeners();
      }
    }}

