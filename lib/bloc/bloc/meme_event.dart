part of 'meme_bloc.dart';

@immutable
abstract class MemeEvent extends Equatable {
  const MemeEvent();
}

class LoadApiEvent extends MemeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
