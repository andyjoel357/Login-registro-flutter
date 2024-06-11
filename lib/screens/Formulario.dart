import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app_06/screens/Productos.dart';
Future<void> main() async {
runApp(Formulario());
}

class Formulario extends StatelessWidget {
  const Formulario({super.key});

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
        title: const Text('Formulario'),
      ),
      body: Cuerpo(context),
    );
  }
}
Widget Cuerpo(context){
  return(
    Column(
      children: <Widget>[
        Text("ingrese un producto"),
        Idp(),
        Nombre(),
        Precio(),
        Agregar(context)
      ],
    )
  );
}
final TextEditingController _idP = TextEditingController();
Widget Idp(){
  return(
    TextField(
    controller: _idP,
    decoration:InputDecoration(hintText: "Ingrese el ID"),
    )
  );
}

final TextEditingController _nombr = TextEditingController();
Widget Nombre(){
  return(
    TextField(
    controller: _nombr,
    decoration:InputDecoration(hintText: "Ingrese el nombre del product"),
    )
  );
}
final TextEditingController _precio = TextEditingController();
Widget Precio(){
  return(
    TextField(
    controller: _precio,
    decoration:InputDecoration(hintText: "Ingrese el precio"),
    )
  );
}

Widget Agregar (context){
return(
  FilledButton(onPressed: (){
    New(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Productos()));
  }, child: Text("Agregar New"))
);
}

Future<void>  New (context)  async {
DatabaseReference ref = FirebaseDatabase.instance.ref("productos/"+ _idP.text);
 await ref.set({
  "id": _idP.text,
  "nombre": _nombr.text,
  "precio": _precio.text,
});
}