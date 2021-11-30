import 'package:flutter/material.dart';

class TacheDelete extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Etes vous sure de vouloire supprimer cette Tache?'),
      actions: <Widget> [
        FlatButton(
          child: Text('OUI'),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
          ),
        FlatButton(
          child: Text('NON'),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        ),
      ],
      
    );
  }
}