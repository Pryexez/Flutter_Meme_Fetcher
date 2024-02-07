import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.error),
        ),
        body: Column(
          children: [
            Center(
              child: Text(error.toString()),
            ),
            Center(
                child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Memes'),
              ),
            )),
          ],
        ));
  }
}
