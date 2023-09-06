import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_lists/core/service/view_model/university_view_model.dart';
import 'package:university_lists/screen/list_tile/view_model/list_tile_view_model.dart';
import 'package:university_lists/screen/tabs/view_model/favorite_universities_view_model.dart';

class FavoritesTabbar extends StatelessWidget {
  FavoritesTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteModel = Provider.of<FavoriteUniversitiesViewModel>(context);
    var favoriteNames = favoriteModel.favoriteUniversityNames.toList();
    var listTileViewModel = ListTileViewModel();
    var universityModel = Provider.of<UniversityListsViewModel>(context);

    return ListView.builder(
      itemCount: favoriteNames.length,
      itemBuilder: (context, index) {
        var university = universityModel.universities?[index];
        return ListTile(
          title: Text(favoriteNames[index]),
          onTap: () async {
            await listTileViewModel.onUniversityTap(university?.university);
          },
        );
      },
    );
  }
}
