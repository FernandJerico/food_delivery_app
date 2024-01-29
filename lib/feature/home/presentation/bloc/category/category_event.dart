part of 'category_bloc.dart';

class CategoryEvent {}

class SelectCategoryEvent extends CategoryEvent {
  final int selectedCategory;

  SelectCategoryEvent(this.selectedCategory);
}
