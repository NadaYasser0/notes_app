import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: SizedBox(
        height: 38 * 2 ,
        child: ListView.builder(
          itemCount: AppColors.listviewColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: GestureDetector(
                onTap: () {

                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color=AppColors.listviewColors[index];
                  setState(() {});
                },
                child: ColorItem(isActive: currentIndex == index, color: AppColors.listviewColors[index],),
              ),
            );
          },
        ),
      ),
    );
  }
}
