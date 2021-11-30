import 'package:flutter/material.dart';
import 'package:todoapp/views/tache_list.dart';
import 'package:todoapp/models/tache_for_listing.dart';

class TacheModify extends StatelessWidget {

  final String tacheID;
  bool get isEditing => tacheID != null;

  TacheModify({required this.tacheID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Tache' : 'creer Tache' )),
      body: Padding(
        padding: const EdgeInsets.all(12.8),
        child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Tache title'
            ),
          ),

          Container(height: 8),

          TextField(
            decoration: InputDecoration(
              hintText: 'Tache content'
            ),
          ),

        Container(height: 16),

          SizedBox(
          width: double.infinity,
          height: 35,
          child: RaisedButton(
            child: Text('Submit', style: TextStyle(color: Colors.white)),
            color: Theme.of(context).primaryColor,
            onPressed: (){
              Navigator.of(context).pop();
            },
           ),
          ),
        ],
      ),
      ),
    );
  }
}