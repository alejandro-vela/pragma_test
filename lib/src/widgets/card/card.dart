import 'package:flutter/material.dart';

import '../../bloc/cat/cat_bloc.dart';
import '../image/custom_image.dart';

class CatCards extends StatelessWidget {
  final CatBloc catBloc;
  final int index;
  final bool isGrid;
  const CatCards({
    super.key,
    required this.catBloc,
    required this.index,
    required this.isGrid,
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
                child: Row(
                  children: [
                    Text(
                      catBloc.catNames[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    isGrid
                        ? Container()
                        : IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.link_rounded),
                          ),
                  ],
                ),
              ),
              isGrid
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        catBloc.cats[index].description,
                      ),
                    )
            ],
          ),
        ));
  }
}
