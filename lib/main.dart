import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgcolor = Colors.indigo.shade300;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 35),

                //title bmi
                Text('BMI',style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.w800,
                )
                ),

                SizedBox(height: 15),

                //textfield for weiaght
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight(in kg)'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 15),

               //textfield for height in feet
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in ft)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 15),


                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in iches)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 15),

                ElevatedButton(onPressed: (){
                  var wt = double.parse(wtController.text.toString());
                  var ft = double.parse(ftController.text.toString());
                  var inch = double.parse(inchController.text.toString());

                  if(wt!=0 && ft!=0 && inch!=0){
                    //BMI calculation

                    var height = ft*0.305 + inch*0.0254;

                    var bmi = wt/pow(height, 2);

                    //for background color
                    var msg = "";
                    if(bmi>25){
                      msg = "You are overweight";
                      bgcolor = Colors.deepOrange.shade200;
                    }else if (bmi<18){
                      msg = "You are underweight";
                      bgcolor = Colors.red.shade400;
                    }else {
                      msg = "You are fit";
                      bgcolor = Colors.green.shade200;
                    }

                    setState(() {
                      result = "$msg \n BMI = ${bmi.toStringAsFixed(2)}";
                    });

                  }else{
                    setState(() {
                      result = "Please fill all the fields!!";
                    });
                  }

                }, child: Text('Calculate')),

                SizedBox(height: 15),

                Text(result),


              ]
            ),
          ),
        ),
      ),
    );
  }
}
