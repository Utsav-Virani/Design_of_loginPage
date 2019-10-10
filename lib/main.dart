import 'package:flutter/material.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.black54,
        brightness: Brightness.dark,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(seconds: 1),
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut,
    );
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white70,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.grey,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white70,
                        )
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(50.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        new TextFormField(
                          decoration : new InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType : TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration : new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType : TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: 30.0),
                        ),
                        new MaterialButton(
                          color: Colors.deepOrangeAccent,
                          textColor: Colors.white70,
                          child: new Text("login"),
                          onPressed: ()=>{},
                          splashColor: Colors.orange,
                        ),
                      ],
                  ),
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
