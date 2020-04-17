import 'package:meta/meta.dart';

@immutable
abstract class MainEvent {}

class ReadyEvent extends MainEvent {}
