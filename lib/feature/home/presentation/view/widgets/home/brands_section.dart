import 'package:ecommerce_app/feature/home/presentation/view/widgets/home/category_section_iteam.dart';
import 'package:ecommerce_app/feature/home/presentation/view_model/home_tap_cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTapCubit, HomeTabState>(
      builder: (context, state) {
        if (state is HomeBrandSucessState) {
          return SizedBox(
            height: 150,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.categoryList.length,
              itemBuilder: (context, index) => CategorySectionIteam(
                categoryResponse: state.categoryList[index],
              ),
            ),
          );
        } else if (state is HomeBrandFailureState) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is HomeBrandLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Text('else');
        }
      },
    );
  }
}
