import 'package:flutter/material.dart';
import 'package:pragma_test/src/bloc/cat/cat_bloc.dart';
import 'package:pragma_test/src/widgets/card/card.dart';

import '../../theme/colors.dart';
import '../../widgets/search/search.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  final CatBloc catBloc;
  const HomeScreen({
    super.key,
    required this.catBloc,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isGrid = !isGrid;
          });
        },
        backgroundColor: AppColors.primaryColor,
        child: isGrid ? Icon(Icons.app_registration_sharp) : Icon(Icons.list),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              child: Text('EL BUSCAR'),
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    dataList: widget.catBloc.catNames,
                  ),
                );
              },
            ),
            isGrid
                ? Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2.4 / 4,
                      children: List.generate(
                        widget.catBloc.cats.length,
                        (index) {
                          return CatCards(
                            catBloc: widget.catBloc,
                            index: index,
                            isGrid: isGrid,
                          );
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: widget.catBloc.cats.length,
                      itemBuilder: (context, index) {
                        return CatCards(
                          catBloc: widget.catBloc,
                          index: index,
                          isGrid: isGrid,
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
