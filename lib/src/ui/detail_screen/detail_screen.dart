import 'package:flutter/material.dart';
import 'package:pragma_test/global_locator.dart';
import 'package:pragma_test/src/bloc/cat/cat_bloc.dart';
import 'package:pragma_test/src/theme/colors.dart';
import 'package:pragma_test/src/widgets/rate/rate_star.dart';

import '../../widgets/image/custom_image.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail';
  final int index;
  const DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final CatBloc catBloc = global<CatBloc>();

  bool showMore = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(catBloc.catNames[widget.index].name),
        ),
        body: Column(
          children: [
            CustomImage(
              image:
                  'https://cdn2.thecatapi.com/images/${catBloc.cats[widget.index].referenceImageId}.jpg',
              height: size.height * 0.3,
              width: size.width,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text(
                      catBloc.cats[widget.index].name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      catBloc.cats[widget.index].description,
                      style: TextStyle(
                        fontSize: 18,
                        wordSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 20),
                    RateStar(
                      rate: catBloc.cats[widget.index].adaptability,
                      item: 'Adaptability',
                    ),
                    RateStar(
                      rate: catBloc.cats[widget.index].affectionLevel,
                      item: 'Affection Level',
                    ),
                    RateStar(
                      rate: catBloc.cats[widget.index].childFriendly,
                      item: 'Child Friendly',
                    ),
                    RateStar(
                      rate: catBloc.cats[widget.index].dogFriendly,
                      item: 'Dog Friendly',
                    ),
                    RateStar(
                      rate: catBloc.cats[widget.index].energyLevel,
                      item: 'Energy Level',
                    ),
                    showMore
                        ? RateStar(
                            rate: catBloc.cats[widget.index].grooming,
                            item: 'Grooming',
                          )
                        : _MoreContet(catBloc: catBloc, index: widget.index),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showMore = !showMore;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: !showMore ? Text('Show less') : Text('Show more'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class _MoreContet extends StatelessWidget {
  final CatBloc catBloc;
  final int index;
  const _MoreContet({
    required this.catBloc,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RateStar(
          rate: catBloc.cats[index].healthIssues,
          item: 'Health Issues',
        ),
        RateStar(
          rate: catBloc.cats[index].intelligence,
          item: 'Intelligence',
        ),
        RateStar(
          rate: catBloc.cats[index].strangerFriendly,
          item: 'Stranger Friendly',
        ),
        RateStar(
          rate: catBloc.cats[index].vocalisation,
          item: 'Vocalisation',
        ),
        SizedBox(height: 20),
        ListTile(
          title: Text(
            'Temperament',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            catBloc.cats[index].temperament,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Text(
            'Origin',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            catBloc.cats[index].origin,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
