import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/config/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';

import '../../data/models/category_model.dart';
import '../bloc/category/category_bloc.dart';
import '../widgets/category_widget.dart';
import '../widgets/list_product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  List<CategoryModel> category = [
    CategoryModel(name: 'All Menu', imagePath: 'assets/icons/all-menu.png'),
    CategoryModel(name: 'Burger', imagePath: 'assets/icons/burger.png'),
    CategoryModel(name: 'Pizza', imagePath: 'assets/icons/pizza.png'),
    CategoryModel(name: 'Sandwich', imagePath: 'assets/icons/sandwich.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            height: sizes.height * 0.15,
            child: Image.asset('assets/images/homepage-pattern-top.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/hamburger.png',
                        scale: 0.8,
                      ),
                    ),
                    Row(
                      children: [
                        Iconify(
                          Ion.location_sharp,
                          color: redColor,
                        ),
                        Text(
                          'Kesambi, Cirebon',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'assets/images/avatar.png',
                          scale: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: sizes.width,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          colors: [Color(0xffFFF0F0), Color(0xffFFDFDF)])),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(
                              left: 24, top: 8, right: 8, bottom: 8),
                          child: Iconify(Ic.round_search),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      CarouselSlider(
                        carouselController: _carouselController,
                        options: CarouselOptions(
                            enlargeCenterPage: false,
                            enableInfiniteScroll: true,
                            height: 170,
                            aspectRatio: 16 / 8,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                            pauseAutoPlayOnTouch: true,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            }),
                        items: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Image.asset('assets/images/hero.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Image.asset('assets/images/hero.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Image.asset('assets/images/hero.png'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? redColor
                                  : lightGreyColor,
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        spacing: 10,
                        direction: Axis.horizontal,
                        children: List<Widget>.generate(
                          category.length,
                          (int index) {
                            return products(context, index, state, category);
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: sizes.height * 0.3,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return listProducts(sizes);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemCount: 2),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
