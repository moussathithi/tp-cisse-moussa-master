import 'package:todoapp/models/tache_for_listing.dart';
import 'package:todoapp/views/tache_list.dart';
import 'package:get_it/get_it.dart';


class TacheService {

  List<TacheForListing> getTacheList() {
    return [
    new TacheForListing(
      tacheID: "1",
      createDateTime: DateTime.now(),
      latestEditDateTime: DateTime.now(),
      tacheTitle: "Tache 1"
    ),

       new TacheForListing(
      tacheID: "2",
      createDateTime: DateTime.now(),
      latestEditDateTime: DateTime.now(),
      tacheTitle: "Tache 2"
    ),

       new TacheForListing(
      tacheID: "3",
      createDateTime: DateTime.now(),
      latestEditDateTime: DateTime.now(),
      tacheTitle: "Tache 3"
    ),
  ];
  }
}