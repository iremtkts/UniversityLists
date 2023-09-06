import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_lists/core/service/view_model/university_view_model.dart';
import 'package:university_lists/screen/list_tile/view_model/list_tile_view_model.dart';
import 'package:university_lists/screen/tabs/view_model/favorite_universities_view_model.dart';

class MainTabbar extends StatelessWidget {
  const MainTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    var universityModel = Provider.of<UniversityListsViewModel>(context);
    var favoritesModel = Provider.of<FavoriteUniversitiesViewModel>(context);
    var listTileViewModel = ListTileViewModel();

    return ListView.builder(
      itemCount: universityModel.universities?.length ?? 0,
      itemBuilder: (context, index) {
        var university = universityModel.universities?[index];
        return ListTile(
          trailing: InkWell(
            onTap: () {
              // when press favorite button
              print("favorite button pressed");
            },
            child: Icon(
              (university?.university?.name != null &&
                      favoritesModel.isFavorite(university!.university!.name))
                  ? Icons.star
                  : Icons.star_border,
              color: (university?.university?.name != null &&
                      favoritesModel.isFavorite(university!.university!.name))
                  ? const Color.fromARGB(255, 234, 210, 3)
                  : null,
            ),
          ),
          title: Text(university?.university?.name ?? 'Unknown'),
          onTap: () async {
            await listTileViewModel.onUniversityTap(university?.university);
          },
        );
      },
    );
  }
}
