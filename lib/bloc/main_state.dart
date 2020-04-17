import 'package:meta/meta.dart';

@immutable
abstract class MainState {}

class InitialMainState extends MainState {}

class ReadyState extends MainState{}