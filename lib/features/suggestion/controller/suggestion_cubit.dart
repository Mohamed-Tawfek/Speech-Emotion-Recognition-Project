import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'suggestion_state.dart';

class SuggestionCubit extends Cubit<SuggestionState> {
  SuggestionCubit() : super(SuggestionInitial());
}
