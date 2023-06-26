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
  bool isGrid = false;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Cats',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: isGrid
                    ? Icon(Icons.app_registration_sharp,
                        color: AppColors.primaryColor)
                    : Icon(Icons.list, color: AppColors.primaryColor),
              ),
            ),
            InkWell(
                onTap: () {
                  focusNode.unfocus();
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                      dataList: widget.catBloc.catNames,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
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
