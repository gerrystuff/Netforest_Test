import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:app/config/app_colors.dart';
import 'package:app/pages/splash/bloc/bloc.dart' as bloc;
import 'package:animate_do/animate_do.dart';

class PageTest extends StatelessWidget {
  const PageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc.Bloc()..add(bloc.LoadInitialEvent()),
      child: BlocListener<bloc.Bloc, bloc.State>(
        listener: (context, state) {
          if (state is bloc.FinalLoadState) {
            Modular.to.navigate('/articles');
          }
        },
        child: const Scaffold(
          backgroundColor: AppColors.primaryBlack,
          body: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 1000),
                child: Column(
                  children: const [
                    Text(
                      "Cargando",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          FadeInUp(
            child: Center(
              child: Text(
                "app",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          FadeInLeft(
            child: Center(
              child: SizedBox(
                height: 80,
                child: Lottie.asset('assets/loading/loading_init.json'),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          FadeInRight(
            child: const Text(
              'V.1.0.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
