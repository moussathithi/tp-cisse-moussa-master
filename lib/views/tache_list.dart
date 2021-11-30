import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoapp/models/tache_for_listing.dart';
import 'package:todoapp/views/tache_delete.dart';
import 'package:todoapp/views/tache_modify.dart';

import 'package:todoapp/services/tache_service.dart';
import 'package:get_it/get_it.dart';

class TacheList extends StatefulWidget{


  @override
  State<TacheList> createState() => _TacheListState();
}

class _TacheListState extends State<TacheList> {
  TacheService get Service => GetIt.I<TacheService>();

  List<TacheForListing> tache = [];

String formatDateTime(DateTime dateTime){
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}

@override
  void initState() {
    tache = Service.getTacheList();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Liste des taches')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => TacheModify(tacheID: '',)));
        },
        child: Icon(Icons.add),
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(tache[index].tacheID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){
              },
              confirmDismiss: (direction) async {
               final result = await showDialog(
                  context: context,
                  builder: (_) => TacheDelete()
                 );
                 print(result);
                 return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16),
 
                child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),

              ),
              child: ListTile(
                title: Text(
                  tache[index].tacheTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text('last edited on ${formatDateTime(tache[index].latestEditDateTime)}'),
                onTap: () {
                  Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => TacheModify(tacheID: tache[index].tacheID)));
                },
              ),
            );
          },
          itemCount: tache.length,
        ),
    );
  }
}
