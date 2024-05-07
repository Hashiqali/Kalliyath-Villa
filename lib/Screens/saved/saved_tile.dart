import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/bloc/saved_bloc.dart';
import 'package:kalliyath_villa/Screens/saved/saved_grid_tile/saved_grid_tile.dart';
import 'package:kalliyath_villa/Screens/saved/saved_page.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class SavedTile extends StatelessWidget {
  const SavedTile({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
        bloc: savedbloc,
        builder: (context, state) {
          if (state is SavedbuildState) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: state.saveddetails.isEmpty
                  ? SizedBox(
                      height: size.height - 95,
                      child: Center(
                        child: Text('No villas',
                            style:
                                apptextstyle(color: AppColors.white, size: 15)),
                      ),
                    )
                  : ListView.separated(
                      itemCount: state.saveddetails.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (ctx, index) {
                        final details = state.saveddetails[index];
                        final image = details['images'];
                        return savedGridTile(
                            context: context,
                            size: size,
                            details: details,
                            image: image);
                      }),
            );
          }
          return Container();
        });
  }
}
