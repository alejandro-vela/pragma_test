import 'package:flutter/material.dart';
import 'package:pragma_test/global_locator.dart';
import 'package:pragma_test/src/bloc/cat/cat_bloc.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  final int index;
  DetailScreen({super.key, required this.index});

  final CatBloc catbloc = global<CatBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catbloc.catNames[index].name),
      ),
    );
  }
}
