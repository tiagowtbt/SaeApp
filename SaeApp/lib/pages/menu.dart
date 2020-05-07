import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:saeapp/pages/game.dart';
import 'package:saeapp/services/authentication.dart';



class menu extends StatefulWidget {
  menu({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SaeApp'),
        actions: <Widget> [
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: signOut)

        ],
      ),



      /*drawer: Drawer( //Menuzim com configurações

        child: ListView(
          children: <Widget>[


            ButtonTheme( //Botão para configurar eventos
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => config_ev(),
                    ),
                  );
                },
                child: Text(
                    "Configurar eventos",
                    style: TextStyle(color: Colors.teal)
                ),
                color: Colors.white,
              ),
            ),

            Divider(),

            ButtonTheme( //Botão para configurar pensamentos
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => config_pe(),
                    ),
                  );
                },
                child: Text(
                    "Configurar pensamentos",
                    style: TextStyle(color: Colors.teal)
                ),
                color: Colors.white,
              ),
            ),

            Divider(),

            ButtonTheme( //Botao para configurar emoções
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => config_em(),
                    ),
                  );
                },
                child: Text(
                    "Configurar emoções",
                    style: TextStyle(color: Colors.teal)
                ),
                color: Colors.white,
              ),
            ),

            Divider(),

            ButtonTheme( //Botão para configurar ações
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => config_ac(),
                    ),
                  );
                },
                child: Text(
                    "Configurar ações",
                    style: TextStyle(color: Colors.teal)
                ),
                color: Colors.white,
              ),
            ),

            Divider(),

            ButtonTheme( //Botão para configurar conta
              height: 100.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => conta(),
                    ),
                  );
                },
                child: Text(
                    "Configurar conta",
                    style: TextStyle(color: Colors.teal)
                ),
                color: Colors.white,
              ),
            ),


          ],

        ),
      ),*/


      body: Padding( //Tela principal
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[




              ButtonTheme( //Botão para começar o jogo
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => game(),
                      ),
                    );
                  },
                  child: Text(
                      "Jogar",
                      style: TextStyle(color: Colors.white)
                  ),
                ),
              ),



            ],

          ),
        ),
      ),
    );
  }
}
