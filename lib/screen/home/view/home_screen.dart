import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_lists/core/service/view_model/university_view_model.dart';
import 'package:university_lists/screen/tabs/view/favorites_tabbar.dart';
import 'package:university_lists/screen/tabs/view/main_tabbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Universities'),
        ),
        body: FutureBuilder(
            future:
                Provider.of<UniversityListsViewModel>(context, listen: false)
                    .fetchUniversities(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                return Column(children: [
                  const TabBar(tabs: [
                    Tab(
                      icon: Icon(
                        Icons.home,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                    )
                  ]),
                  Expanded(
                      child: TabBarView(children: [
                    MainTabbar(),
                    FavoritesTabbar(),
                  ]))
                ]);
              }
            }),
      ),
    );
  }
}
