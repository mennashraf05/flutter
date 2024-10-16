import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Calculator(),
    );
  }}
    
class Calculator extends StatefulWidget {
@override
  _CalculatorState creeateState() => _CalculatorState();
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _CalculatorState extends State<Calculator> {
Widget calcbutton(String btntxt,  Color btncolor, Color txtcolor) {
return Container(
  child : RaisedButton(
    onPressed: ()
  {
    //todo add function for button press
  },
  child: Text(btntxt,
  style:TextStyle(
  fontSize:35,
  color: txtcolor,
),
),
shape:CircleBorder(),
color:btncolor,
padding: EdgeInsets.all(20),
  ),
);
}

  @override
  Widget build(BuildContext context){
    var row = Row();
    return Scaffold( 
      backgroundColor: Colors.black,
      appBar: AppBar(title :Text('Calculator'),backgroundColor: Colors.black,),
      body: Padding(padding: EdgeInsets.symmetric(horizontal:5),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding (padding:EdgeInsets.all(10.0) ,
            child:  Text('0' ,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white,
            fontSize: 100
            ),
            ),
            ),
          ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // here buttons function will be called where we will pass some  arguements 
               calcbutton('AC',Colors.grey, Colors.black),
              calcbutton('+/-',Colors.grey, Colors.black),
               calcbutton('%',Colors.grey, Colors.black),
               calcbutton('/',Colors.amber[700]!, Colors.black),
                ],
              ),
              SizedBox(height: 10,),
              //now we will copy above row code and mane more rows
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // here buttons function will be called where we will pass some  arguements 
               calcbutton('7',Colors.grey[850]!, Colors.white),
              calcbutton('8',Colors.grey[850]!, Colors.white),
               calcbutton('9',Colors.grey[850]!, Colors.white),
               calcbutton('+',Colors.amber[700]!, Colors.white),

                ],
              ),
              SizedBox(height: 10,),
              //now we will copy above rows in similar way
                        
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // here buttons function will be called where we will pass some  arguements 
               calcbutton('4',Colors.grey[850]!, Colors.white),
              calcbutton('5',Colors.grey[850]!, Colors.white),
               calcbutton('6',Colors.grey[850]!, Colors.white),
               calcbutton('-',Colors.amber[700]!, Colors.white),

                ],
              ),
              SizedBox(height: 10,),

              //now we will copy above rows in similar way
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // here buttons function will be called where we will pass some  arguements 
               calcbutton('1',Colors.grey[850]!, Colors.white),
              calcbutton('2',Colors.grey[850]!, Colors.white),
               calcbutton('3',Colors.grey[850]!, Colors.white),
               calcbutton('+',Colors.amber[700]!, Colors.white),

                ],
              ),
              SizedBox(height: 10,),          
      //now last row is different as it has 0 button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children :[
          // this is button 0
          RaisedButton(
            padding:EdgeInsets.fromLTRB(34, 20, 128,20),
            onPressed: (){
              // button function
            },
            shape:StadiumBorder(),
            child: Text("0",
            style:  TextStyle(
              fontSize: 35,
              color : Colors.white   
                    ),
          ),
          color:Colors.grey[850],
          ),
          calcbutton('3', Colors.grey[850]!, Colors.white),
          calcbutton('+', Colors.amber[850]!, Colors.white),

        ],
      )
      ],
    ),
    ),
    );
  }
  // here we will write calculator logic for the app
  
  }

  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }






