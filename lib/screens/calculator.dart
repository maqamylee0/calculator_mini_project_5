import 'package:calculator_mini_project_5/providers/calc_provider.dart';
import 'package:calculator_mini_project_5/screens/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    var calcDisplay = Provider.of<CalcProvider>(context);

    List <String> buttonValues = ['C' ,'/', 'x','7','8','9','-','4','5','6','+',"1",'2','3','%','0','.','=','**'];

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                padding: EdgeInsets.all(20),
                height: 150,
                width:deviceWidth ,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20)

              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: deviceWidth,
                    child: ListView.builder(
                        itemCount: calcDisplay.display.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index ){
                          return  Text('${calcDisplay.display[index]}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),);

                        }),
                  ),                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: deviceWidth,
                    child: ListView.builder(
                      itemCount: calcDisplay.displayAnswers.length,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index ){
                        return  Text('${calcDisplay.displayAnswers[index]}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),);

                    }),
                  ),
                ],

              )
                ,),

              SizedBox(height: 50,),

              Expanded(
          // height: deviceHeight * 0.7,
                child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(buttonValues.length, (index) {
                  return Center(
                    child: Button(value: buttonValues[index]),
                  );
                }
                )
          ),
              )

        ],
          ),
        ),
      ),
    );
  }
}
