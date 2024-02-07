import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';

import 'package:tutorial/bloc/bloc/meme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MemePage extends StatefulWidget {
  const MemePage({super.key, required this.title});

  final String title;

  @override
  State<MemePage> createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MemeBloc(1)..add(LoadApiEvent())),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
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
                          AppLocalizations.of(context)!.meme_title,
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
                      onPressed: () => context.go('/animalpage'),
                      child: Text(AppLocalizations.of(context)!.animals),
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
                      child: Text(AppLocalizations.of(context)!.meme_button),
                    ),
                  )),
                ],
              );
            },
          )),
    );
  }
}
