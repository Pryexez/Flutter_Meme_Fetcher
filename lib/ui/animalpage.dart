import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:tutorial/bloc/bloc/meme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key, required this.title});

  final String title;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MemeBloc(2)..add(LoadApiEvent())),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.animals),
          ),
          body: BlocBuilder<MemeBloc, MemeState>(
            builder: (context, state) {
              late Widget pic = SizedBox(
                  child: CircularProgressIndicator(), height: 500, width: 500);

              if (state is MemeLoadingState) {
                pic = state.pic;
              }

              if (state is MemeLoadedState) {
                pic = state.pic;
              }

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.animals_title,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: pic,
                  ),
                  Center(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () => context.go('/'),
                      child: const Text('Meme'),
                    ),
                  )),
                  Center(
                      child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () => context.go('/error'),
                      child: Text(AppLocalizations.of(context)!.errorpage_test),
                    ),
                  )),
                  Center(
                      child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () => BlocProvider.of<MemeBloc>(context)
                          .add(LoadApiEvent()),
                      child: Text(
                          AppLocalizations.of(context)!.animal_screen_button),
                    ),
                  )),
                ],
              );
            },
          )),
    );
  }
}
