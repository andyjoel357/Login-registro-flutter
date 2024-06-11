import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_06/screens/login.dart';
void main(){
  runApp(Registro());
}
class Registro extends StatelessWidget {
  const Registro({super.key});

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
        title: const Text('Registro'),
      ),
      body: Cuerpo(context),
    );
  }
}
Widget Cuerpo(context){
  return(
    Column(
      children: <Widget>[
        User(),
        Password(),
        BotonReg(context)
      ],
    )
  );
}
final TextEditingController _users = TextEditingController();
Widget User (){
  return(
    TextField(
      controller: _users,
      decoration:InputDecoration(hintText: "Ingrese su usuario"),
    )
  );
}
final TextEditingController _password = TextEditingController();
Widget Password (){
  return(
    TextField(
    controller: _password,
    decoration:InputDecoration(hintText: "Ingrese su contraseña"),
    )
  );
}
Widget BotonReg (context){
return(
  FilledButton(onPressed: (){
    registrarse(context);
  }, child: Text("Registrarse"))
);
}
Future<void> registrarse (context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _users.text, password: _password.text,);
    /////////////////////
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Login()));
    /// 
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}