import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_06/screens/login.dart';
import 'package:flutter_app_06/screens/registro.dart';

Future<void> main() async {
  runApp(Fire());
       WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
}
class Fire extends StatelessWidget {
  const Fire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
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
        title: const Text('Title'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo (context){
  return(
    Column(
      children: <Widget>[
        Text("Welcome"),
        BootonLogin(context),
        BotonRegistro(context)
      ],
    )
  );
}

Widget BootonLogin(context){
return(
  FilledButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Login()));
  }, child: Text("Login"))
);
}

Widget BotonRegistro(context){
  return(
    ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(0, 12, 243, 58))),
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Registro()));
    }, child: Text("Registro"))
  );
}