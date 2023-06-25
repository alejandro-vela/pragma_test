import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/src/bloc/cat/cat_bloc.dart';
import 'package:pragma_test/src/ui/splash_screen/error_screen.dart';

import '../../../../global_locator.dart';
import '../../theme/colors.dart';
import '../../utils/navigation_service.dart';
import '../../widgets/image/custom_image.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  CatBloc catBloc = CatBloc();
  late Animation<double> animation;
  late AnimationController animationController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  @override
  void initState() {
    catBloc = global<CatBloc>();
    catBloc.add(GetCatsEvent());
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).unfocus();
    });
    _animationController(begin: 0.0, end: 0.9);
    animationController.forward();
    super.initState();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _animationController(
      {int? duration, required double begin, required double end}) {
    animationController = AnimationController(
        duration: Duration(milliseconds: duration ?? 800), vsync: this);
    animation = Tween(begin: begin, end: end).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<CatBloc, CatState>(
        bloc: catBloc,
        listener: (context, state) async {
          if (state is CatLoadedState) {
            _animationController(begin: 0.9, end: 1.0);
            await animationController.forward().then(
                  (value) => {
                    NavigationService.pushAndRemoveUntil(
                      context: context,
                      screen: HomeScreen(catBloc: catBloc),
                      routeName: HomeScreen.routeName,
                    )
                  },
                );
          }
          if (state is CatErrorState) {
            _animationController(begin: 0.9, end: 1.0);
            await animationController.forward().then(
                  (value) => {
                    NavigationService.pushAndRemoveUntil(
                        context: context,
                        screen: ErrorScreen(),
                        routeName: ErrorScreen.routeName)
                  },
                );
          }
        },
        child: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomImage(
                      image: 'assets/img/pragma_logo.png',
                      height: size.height * 0.1,
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: size.width * 0.4,
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          minHeight: 5.0,
                          value: animation.value,
                          color: AppColors.primaryColor,
                          backgroundColor: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
