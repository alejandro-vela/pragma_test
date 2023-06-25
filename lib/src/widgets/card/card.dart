import 'package:flutter/material.dart';

import '../../bloc/cat/cat_bloc.dart';
import '../image/custom_image.dart';

class CatCards extends StatelessWidget {
  final CatBloc catBloc;
  final int index;
  const CatCards({
    super.key,
    required this.catBloc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            children: <Widget>[
              CustomImage(
                image:
                    'https://cdn2.thecatapi.com/images/${catBloc.cats[index].referenceImageId}.jpg',
                height: size.height * 0.3,
                width: size.width,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Montañas'),
              ),
            ],
          ),
        ));
  }
}
