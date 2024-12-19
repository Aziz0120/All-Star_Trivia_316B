import 'dart:typed_data';

import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/goals/achiv/achiv_page.dart';
import 'package:all_star_trivia_316_b/goals/goals_add.dart';
import 'package:all_star_trivia_316_b/goals/logic/goals_hive_model.dart';
import 'package:all_star_trivia_316_b/goals/logic/goals_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<GoalsHiveModel> listGoasl = [];
  bool loadaRemsam = false;

  @override
  void initState() {
    super.initState();
    getAchivList();
  }

  getAchivList() async {
    setState(() {
      loadaRemsam = true;
    });
    listGoasl.clear();
    final repoList = await GoalsRepoImpl().getGoals();
    setState(() {
      listGoasl = repoList.reversed.toList();
      loadaRemsam = false;
    });
  }

  bool page = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Goals',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 34.h),
            Container(
              width: double.infinity,
              height: 31.h,
              decoration: BoxDecoration(
                color: TriColors.bgCont,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          page = false;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 31.h,
                        decoration: BoxDecoration(
                          color: page ? TriColors.bgCont : TriColors.tiffany,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Achievements',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: page ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          page = true;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 31.h,
                        decoration: BoxDecoration(
                          color: page ? TriColors.tiffany : TriColors.bgCont,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Goals',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: page ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            !page
                ? const Expanded(
                    child: AchivPage(),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          loadaRemsam
                              ? const Center(
                                  child: CupertinoActivityIndicator(
                                      color: TriColors.tiffany))
                              : listGoasl.isNotEmpty
                                  ? ListView.separated(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: listGoasl.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 12),
                                      itemBuilder: (context, index) =>
                                          GoalsWidget(
                                        model: listGoasl[index],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        SizedBox(height: 12.h),
                                        Container(
                                          width: double.infinity,
                                          height: 120.h,
                                          decoration: BoxDecoration(
                                            color: TriColors.bgCont,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/goal.png',
                                                width: 40.w,
                                                color: TriColors.tiffany,
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                'Create your own Goals card',
                                                textAlign: TextAlign.center,
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
                                      ],
                                    ),
                          SizedBox(height: 8.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GoalsAdd(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/icons/addIcon.png',
                              width: 100.w,
                            ),
                          ),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class GoalsWidget extends StatefulWidget {
  const GoalsWidget({
    super.key,
    required this.model,
  });
  final GoalsHiveModel model;

  @override
  State<GoalsWidget> createState() => _GoalsWidgetState();
}

class _GoalsWidgetState extends State<GoalsWidget> {
  late Uint8List imageCodeUnitsDetail;
  @override
  void initState() {
    imageCodeUnitsDetail = Uint8List.fromList(widget.model.image.codeUnits);
    super.initState();
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
                image: MemoryImage(imageCodeUnitsDetail),
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
                Text(
                  widget.model.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: TriColors.tiffany,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.model.description,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.sp,
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
