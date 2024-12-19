import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/legends/game/legend_game.dart';
import 'package:all_star_trivia_316_b/legends/game/list.dart';
import 'package:all_star_trivia_316_b/legends/legends_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class LegendDetaile extends StatefulWidget {
  const LegendDetaile(
      {super.key, required this.model, required this.indexGame});
  final LegendsModel model;
  final int indexGame;

  @override
  State<LegendDetaile> createState() => _LegendDetaileState();
}

class _LegendDetaileState extends State<LegendDetaile> {
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
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Basketball Legends',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Image.asset(widget.model.image),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                height: 120.h,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.name,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: TriColors.tiffany,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Share.share(
                                '${widget.model.name}\n${widget.model.title}');
                          },
                          child: const Icon(
                            Icons.ios_share,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.model.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.tiffany,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.model.biography,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: TriColors.tiffany,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.model.achiv,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: TriColors.tiffany,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LegendGame(
                          model: widget.model, indexGame: widget.indexGame),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 62.h,
                  decoration: BoxDecoration(
                    color: TriColors.tiffany,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Start test',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.bgCont,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
