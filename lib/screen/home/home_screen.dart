import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_lists/screen/universities/view_model/favorite_universities_view_model.dart';

import 'package:university_lists/screen/universities/view_model/university_viewmodel.dart';

import 'package:university_lists/screen/universities/widgets/tabs/tabs.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UniversityListsViewModel>(
          create: (_) => UniversityListsViewModel(),
        ),
        ChangeNotifierProvider<FavoriteUniversitiesViewModel>(
          create: (_) => FavoriteUniversitiesViewModel(),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Üniversiteler'),
          ),
          body: Builder(
            builder: (context) {
              var universityVM =
                  Provider.of<UniversityListsViewModel>(context, listen: false);
              // var favoriteVM = Provider.of<FavoriteUniversitiesViewModel>
              (context, listen: false);

              return FutureBuilder(
                  future: universityVM.fetchData(),
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
                              color: Colors.deepOrange,
                            ),
                          )
                        ]),
                        Expanded(
                            child: TabBarView(children: [
                          TabbarScreen(showFavorites: false),
                          TabbarScreen(showFavorites: true)
                        ]))
                      ]);
                    }
                  });
            },
          ),
        ),
      ),
    );
  }
}
