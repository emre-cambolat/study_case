import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_case/view/utils/app_colors.dart';
import 'package:study_case/view/utils/app_svgs.dart';
import 'package:study_case/view/utils/custom_text_style.dart';
import 'package:study_case/view/widgets/exercies_box.dart';
import '../view_model/exercies_store.dart';
import 'widgets/drawer_menu.dart';
import 'widgets/search_bar.dart';

class ExerciesUI extends StatefulWidget {
  const ExerciesUI({super.key});

  @override
  State<ExerciesUI> createState() => _ExerciesUIState();
}

class _ExerciesUIState extends State<ExerciesUI> {
  final ExerciesView _exerciesView = ExerciesView();

  @override
  void initState() {
    _exerciesView.initPage();
    super.initState();
  }

  @override
  void dispose() {
    _exerciesView.disposepage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _exerciesView.scaffoldKey,
      backgroundColor: AppColors.lightGrey,
      endDrawer: SafeArea(
        child: DrawerMenu(exerciesView: _exerciesView),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Column(
            children: [
              _topBar(),
              _resultInfo(),
              _exerciesList(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _exerciesList() {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (_exerciesView.isLoading) {
            return _loadingIndicator();
          }
          return RefreshIndicator(
            onRefresh: _exerciesView.searchName,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      _exerciesView.exerciesList.length,
                      (index) {
                        return ExerciesBox(
                          exerciesView: _exerciesView,
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          SearchBar(exerciesView: _exerciesView),
          _filterIcon(),
        ],
      ),
    );
  }

  Center _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.darkGrey,
      ),
    );
  }

  Padding _resultInfo() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Observer(builder: (_) {
        return Text(
          _exerciesView.exerciesList.length.toString() + " results found.",
          style: CustomTextStyle.titleTextStyle,
        );
      }),
    );
  }

  Padding _filterIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          // child: Icon(
          //   Icons.adju,
          //   color: AppColors.darkGrey,
          // ),
          child: SvgPicture.string(
            AppSVGs.filterIcon,
            width: 24,
            height: 24,
          ),
        ),
        onTap: _exerciesView.openDrawer,
      ),
    );
  }
}
