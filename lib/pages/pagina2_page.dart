import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {
  
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newUser = User(
      nombre: "Daniel",
      edad: 16,
      profesiones: ["FullStack Developer"]
    );
    final userBlocProvider = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBlocProvider.add(ActivateUserEvent(newUser));
              }
            ),

            MaterialButton(
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBlocProvider.add(ChangeUserAgeEvent(28));
              }
            ),

            MaterialButton(
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBlocProvider.add(AddProfessionEvent("Developer of Videogame"));
              }
            ),

            MaterialButton(
              child: const Text('Cambiar Nombre', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBlocProvider.add(ChangeUserNameEvent("Laura"));
              }
            ),
            
            MaterialButton(
              child: const Text('Reset datos', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBlocProvider.add(ResetUserDataEvent(newUser));
              }
            ),

          ],
        )
     ),
   );
  }
}