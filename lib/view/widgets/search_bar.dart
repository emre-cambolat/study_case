import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../view_model/exercies_store.dart';
import '../utils/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required ExerciesView exerciesView,
  })  : _exerciesView = exerciesView,
        super(key: key);

  final ExerciesView _exerciesView;

  Widget _suffixIcon(BuildContext context) {
    return Observer(
      builder: (_) {
        return _exerciesView.textFieldValue.isEmpty
            ? SizedBox.shrink()
            : InkWell(
                onTap: () {
                  _exerciesView.clearSearchValue(context);
                },
                child: Icon(
                  Icons.clear,
                  size: 20,
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _exerciesView.tfSearch,
        decoration: InputDecoration(
          suffixIcon: _suffixIcon(context),
          hintText: "Search",
          hintStyle: TextStyle(color: AppColors.darkGrey),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 18,
          ),
        ),
        onChanged: (value) async {
          await _exerciesView.searchName();
        },
      ),
    );
  }
}
