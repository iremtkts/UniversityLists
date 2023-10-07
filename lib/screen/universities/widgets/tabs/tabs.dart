// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:university_lists/models/university_model.dart';
import 'package:university_lists/screen/universities/view_model/favorite_universities_view_model.dart';
import 'package:university_lists/screen/universities/view_model/university_viewmodel.dart';

class TabbarScreen extends StatelessWidget {
  final bool showFavorites;

  TabbarScreen({
    Key? key,
    required this.showFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var universityModel = Provider.of<UniversityListsViewModel>(context);
    var favoritesModel = Provider.of<FavoriteUniversitiesViewModel>(context);

    List<University> displayList = showFavorites
        ? universityModel.universities!
            .where((uni) => favoritesModel.isFavorite(uni.name))
            .toList()
        : universityModel.universities ?? [];

    Future<void> onUniversityTap(University? university) async {
      final url = university?.webPages.first;
      if (url != null) {
        await launchUrl(Uri.parse(url));
      } else {
        throw "Could not launch $url";
      }
    }

    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        var university = displayList[index];
        return ListTile(
          trailing: InkWell(
            onTap: () {
              print("favorite button pressed");

              favoritesModel.toggleFavorites(university.name);
            },
            child: Icon(
              (university.name != null &&
                      favoritesModel.isFavorite(university.name))
                  ? Icons.star
                  : Icons.star_border,
              color: (university.name != null &&
                      favoritesModel.isFavorite(university.name))
                  ? const Color.fromARGB(255, 234, 210, 3)
                  : null,
            ),
          ),
          title: Text(university.name),
          onTap: () async {
            await onUniversityTap(university);
          },
        );
      },
    );
  }
}
