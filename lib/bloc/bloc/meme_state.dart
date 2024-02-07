part of 'meme_bloc.dart';

@immutable
abstract class MemeState {}

class MemeInitial extends MemeState {}

class MemeLoadedState extends MemeState {
  final Widget pic;

  MemeLoadedState(this.pic);

  List<Object?> get props => [pic];
}

class MemeLoadingState extends MemeState {
  final Widget pic = const SizedBox(
      child: CircularProgressIndicator(), height: 500, width: 500);
  List<Object> get props => [pic];
}
