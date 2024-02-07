import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../services/meme_controller.dart';

part 'meme_event.dart';
part 'meme_state.dart';

class MemeBloc extends Bloc<MemeEvent, MemeState> {
  int category;
  MemeBloc(this.category) : super(MemeInitial()) {
    on<LoadApiEvent>((event, emit) async {
      emit(MemeLoadingState());
      late String url;
      if (category == 1) {
        url = await locator.get<MemeDomainController>().getMemePictureUrl();
      }
      if (category == 2) {
        url = await locator.get<MemeDomainController>().getAnimalPictureUrl();
      }
      Widget pic = Image.network(url, height: 500, width: 500);
      emit(MemeLoadedState(pic));
    });
  }
}
