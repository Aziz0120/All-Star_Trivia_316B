import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/legends/legend_detaile.dart';
import 'package:all_star_trivia_316_b/legends/legends_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LegendsScreen extends StatelessWidget {
  const LegendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Basketball Legends',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 34.h,
          horizontal: 24.w,
        ),
        shrinkWrap: true,
        itemCount: listLegends.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => WIdgetLegends(
          model: listLegends[index],
          indexGame: index,
        ),
      ),
    );
  }
}

class WIdgetLegends extends StatelessWidget {
  const WIdgetLegends({
    super.key,
    required this.model,
    required this.indexGame,
  });
  final LegendsModel model;
  final int indexGame;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LegendDetaile(model: model, indexGame: indexGame),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          color: TriColors.bgCont,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 170.w,
              height: 120.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(model.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          model.name,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: TriColors.tiffany,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Color(0xffA5A5A5),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    model.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: TriColors.tiffany,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }
}
