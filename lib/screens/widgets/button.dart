import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/calc_provider.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.value}) : super(key: key);
 final String value;
  @override
  Widget build(BuildContext context) {
    var calcDisplay = Provider.of<CalcProvider>(context);

    return GestureDetector(
      onTap: (){
          calcDisplay.setDisplay(value);
      },
      child: Container(
        child: Card(
          color: Colors.orange,
          child: Center(
            child: Text('$value',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
          ),
        ),
      ),
    );
  }
}
