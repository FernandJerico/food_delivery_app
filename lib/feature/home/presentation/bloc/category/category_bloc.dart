import 'package:bloc/bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {
      if (event is SelectCategoryEvent) {
        _onCategorySelected(event, emit);
      }
    });
  }

  void _onCategorySelected(
      SelectCategoryEvent event, Emitter<CategoryState> emit) {
    emit(CategoryState(selectedCategory: event.selectedCategory));
  }

  void onCategorySelected(int index) {
    add(SelectCategoryEvent(index));
  }
}
