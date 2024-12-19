import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/legends/game/list.dart';
import 'package:all_star_trivia_316_b/legends/legends_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: SavedData.getLegendLikeList(),
          builder: (context, data) {
            List<String> list = data.data ?? [];
            return list.isNotEmpty
                ? ListView.separated(
                    padding: EdgeInsets.symmetric(
                      vertical: 34.h,
                      horizontal: 24.w,
                    ),
                    shrinkWrap: true,
                    itemCount: list.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      List<LegendsModel> asas = listLegends
                          .where((e) => e.title == list[index])
                          .toList();
                      if (asas.isNotEmpty) {
                        return WIdgetLike(model: asas[0]);
                      } else {
                        return Container();
                      }
                    },
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 34.h,
                      horizontal: 24.w,
                    ),
                    width: double.infinity,
                    height: 124.h,
                    decoration: BoxDecoration(
                      color: TriColors.bgCont,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/likeActive.png',
                          width: 40.w,
                          color: TriColors.tiffany,
                        ),
                        Text(
                          'Add your favorite basketball player',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: TriColors.tiffany,
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}

class WIdgetLike extends StatefulWidget {
  const WIdgetLike({super.key, required this.model});
  final LegendsModel model;

  @override
  State<WIdgetLike> createState() => _WIdgetLikeState();
}

class _WIdgetLikeState extends State<WIdgetLike> {
  bool isActive = false;

  List<String> workoutsList = [];

  @override
  void initState() {
    savedData();

    super.initState();
  }

  Future<void> savedData() async {
    List<String> workoutsListSavedData = await SavedData.getLegendLikeList();
    setState(() {
      workoutsList = workoutsListSavedData;
      isActive = workoutsList.contains(widget.model.title);
    });
  }

  Future<void> savedDataAdd(String subTitle) async {
    List<String> workoutsListSavedData = await SavedData.getLegendLikeList();
    setState(() {
      workoutsList = workoutsListSavedData;
      isActive = workoutsList.contains(widget.model.title);

      workoutsList.add(subTitle);
    });
    await SavedData.setLegendLikeList(workoutsList);
  }

  Future<void> savedDatRremove(String subTitle) async {
    List<String> workoutsListSavedData = await SavedData.getLegendLikeList();
    setState(() {
      workoutsList = workoutsListSavedData;
      isActive = workoutsList.contains(widget.model.title);

      workoutsList.remove(subTitle);
    });
    await SavedData.setLegendLikeList(workoutsList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: AssetImage(widget.model.image),
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
                        widget.model.name,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: TriColors.tiffany,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () async {
                          setState(() {
                            isActive = !isActive;
                          });
                          if (isActive == true) {
                            await savedDataAdd(widget.model.title);
                          } else {
                            await savedDatRremove(widget.model.title);
                          }
                          savedData();
                        },
                        child: workoutsList.contains(widget.model.title)
                            ? Image.asset(
                                'assets/icons/likeActive.png',
                                width: 24.w,
                              )
                            : isActive == true
                                ? Image.asset(
                                    'assets/icons/likeActive.png',
                                    width: 24.w,
                                  )
                                : Image.asset(
                                    'assets/icons/likeActive.png',
                                    width: 24.w,
                                    color: Colors.white,
                                  )),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.model.title,
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
    );
  }
}
