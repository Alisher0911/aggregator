import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController searchController;

  const SearchBox({
    super.key,
    required this.focusNode,
    required this.searchController
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onChanged: (value) {
        context.read<RestaurantCubit>().getSearchResults(value);
      },
      autofocus: true,
      focusNode: focusNode,
      controller: searchController,
      style: GoogleFonts.manrope(
        textStyle: const TextStyle(fontSize: 13, color: Colors.black)
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Поиск",
        hintStyle: GoogleFonts.manrope(
          textStyle: TextStyle(fontSize: 13, color: grayColor)
        ),
        prefixIcon: Icon(
          Icons.search,
          color: grayColor
        ),
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(6)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(6)
        )
      ),
    );
  }
}