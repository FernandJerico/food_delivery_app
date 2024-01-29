import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/themes/theme.dart';
import '../../data/models/category_model.dart';
import '../bloc/category/category_bloc.dart';

GestureDetector products(BuildContext context, int index, CategoryState state,
    List<CategoryModel> categories) {
  final sizes = MediaQuery.of(context).size;
  final category = categories[index];
  return GestureDetector(
    onTap: () {
      context.read<CategoryBloc>().add(SelectCategoryEvent(index));
    },
    child: Container(
      height: 44,
      width: sizes.width * 0.35,
      decoration: BoxDecoration(
          color: state.selectedCategory == index ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: state.selectedCategory == index
                  ? Colors.transparent
                  : redColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            scale: 2,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            category.name,
            style: GoogleFonts.poppins(
                color: state.selectedCategory == index ? whiteColor : greyColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
