import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_06/screens/Productos.dart';


void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return(
    Column(
      children: <Widget>[
        User(context),
        Password(context),
        BotonLog(context)
      ],
    )
  );
}
final TextEditingController _user = TextEditingController();
Widget User (context){
  return(
    TextField(
      controller: _user,
      decoration:InputDecoration(hintText: "Ingrese su usuario"),
    )
  );
}
final TextEditingController _pass = TextEditingController();
Widget Password (context){
  return(
    TextField(
    controller: _pass,
    decoration:InputDecoration(hintText: "Ingrese su contraseña"),
    )
  );
}

Widget BotonLog (context){
return(
  FilledButton(onPressed: (){
    login(context);
  }, child: Text("Login"))
);
}
Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _user.text, password: _pass.text);
    //////////////////  
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Productos()));
      ///////////////////  

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}