import 'package:flutter/material.dart';
import 'dart:math';


class game extends StatefulWidget {

  @override
  gameState createState() => gameState();
}

class Evento {

  String nomeEvento;
  String opcaoPe1, opcaoPe2, opcaoPe3, opcaoPe4, opcaoPe5, opcaoPe6;
  String opcaoEm1, opcaoEm2;
  String opcaoAc1, opcaoAc2;
  Evento(String nome, String pe1, String pe2, String pe3, String pe4, String pe5, String pe6, String em1, String em2, String ac1, String ac2) {

    this.nomeEvento = "$nome";
    this.opcaoPe1 = "$pe1";
    this.opcaoPe2 = "$pe2";
    this.opcaoPe3 = "$pe3";
    this.opcaoPe4 = "$pe4";
    this.opcaoPe5 = "$pe5";
    this.opcaoPe6 = "$pe6";
    this.opcaoEm1 = "$em1";
    this.opcaoEm2 = "$em2";
    this.opcaoAc1 = "$ac1";
    this.opcaoAc2 = "$ac2";
  }
}



class gameState extends State<game> {

  Color color = Colors.white;

  int _currentStep = 0;
  bool buttonState = true;
  static bool OpPe = false;
  static bool OpEm = false;
  static bool OpAc = false;
  var aleat = Random();
  List<Evento> eventos = [
    Evento("Fui convidado para uma festa", 'Acho que não vai dar para ir...', 'Ainda bem! Vou poder usar minha nova camisa', '', '', '', '', 'Feliz', 'Ansioso', 'Inventar uma desculpa', 'Ir a festa')
  ];



  void _buttonChange() {
    setState(() {
      buttonState = !buttonState;
      if(this._currentStep < this._mySteps().length - 1){
        this._currentStep = this._currentStep + 1;
      }else{
        //Logic to check if everything is completed
        print('Completed, check fields.');
      }

    });
  }



  @override

  void initState() {
    super.initState();
    int _eventoGerado = aleat.nextInt(eventos.length);
    nomeG = eventos[_eventoGerado].nomeEvento;
    pe1G = eventos[_eventoGerado].opcaoPe1;
    pe2G = eventos[_eventoGerado].opcaoPe2;
    pe3G = eventos[_eventoGerado].opcaoPe3;
    pe4G = eventos[_eventoGerado].opcaoPe4;
    pe5G = eventos[_eventoGerado].opcaoPe5;
    pe6G = eventos[_eventoGerado].opcaoPe6;
    em1G = eventos[_eventoGerado].opcaoEm1;
    em2G = eventos[_eventoGerado].opcaoEm2;
    ac1G = eventos[_eventoGerado].opcaoAc1;
    ac2G = eventos[_eventoGerado].opcaoAc2;
  }

  String nomeG;
  String pe1G;
  String pe2G;
  String pe3G;
  String pe4G;
  String pe5G;
  String pe6G;
  String em1G;
  String em2G;
  String ac1G;
  String ac2G;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Evento: $nomeG'),
      ),

      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step){
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: (){
          setState(() {
            if(this._currentStep < this._mySteps().length - 1){
              this._currentStep = this._currentStep + 1;
            }else{
              //Logic to check if everything is completed
              print('Completed, check fields.');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if(this._currentStep > 0){
              this._currentStep = this._currentStep - 1;
            }else{
              this._currentStep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text('Pensamentos'),
        content: new Wrap(

          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          direction: Axis.horizontal,

          children: <Widget>[

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$pe1G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$pe2G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$pe3G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$pe4G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$pe5G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$pe6G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),

          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Emoções'),
        content: new Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          direction: Axis.horizontal,
          children: <Widget>[



            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$em1G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),

              ),

            ),
            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$em2G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),


          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Ações'),
        content: new Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          direction: Axis.horizontal,
          children: <Widget>[

            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$ac1G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),
            Container(
              width: 125.0,
              height: 125.0,
              child: RaisedButton (
                onPressed: _buttonChange,
                child: Text('$ac2G', textAlign: TextAlign.center, style: TextStyle(fontSize: 10.0)),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              ),
            ),


          ]
        ),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}