import 'package:flutter/material.dart';
import 'package:pragma_test/src/bloc/cat/cat_bloc.dart';
import 'package:pragma_test/src/widgets/card/card.dart';

import '../../widgets/search/search.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final CatBloc catBloc;
  const HomeScreen({
    super.key,
    required this.catBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              child: Text('EL BUSCAR'),
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    dataList: catBloc.catNames,
                  ),
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: catBloc.cats.length,
                itemBuilder: (context, index) {
                  return CatCards(
                    catBloc: catBloc,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
