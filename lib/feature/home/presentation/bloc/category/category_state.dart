part of 'category_bloc.dart';

class CategoryState {
  final int selectedCategory;

  const CategoryState({this.selectedCategory = 0});
}

final class CategoryInitial extends CategoryState {}
