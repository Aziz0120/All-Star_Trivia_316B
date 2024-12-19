import 'dart:typed_data';

import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/goals/achiv/achiv_add.dart';
import 'package:all_star_trivia_316_b/goals/achiv/logic/achiv_hive_model.dart';
import 'package:all_star_trivia_316_b/goals/achiv/logic/achiv_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchivPage extends StatefulWidget {
  const AchivPage({
    super.key,
  });

  @override
  State<AchivPage> createState() => _AchivPageState();
}

class _AchivPageState extends State<AchivPage> {
  List<AchivHiveModel> listAchiv = [];
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
    listAchiv.clear();
    final repoList = await AchivRepoImpl().getAchiv();
    setState(() {
      listAchiv = repoList.reversed.toList();
      loadaRemsam = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          loadaRemsam
              ? const Center(
                  child: CupertinoActivityIndicator(color: TriColors.tiffany))
              : listAchiv.isNotEmpty
                  ? ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listAchiv.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) => AchivWidget(
                        model: listAchiv[index],
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/goal.png',
                                width: 40.w,
                                color: TriColors.tiffany,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Create your own Achievements card',
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
                  builder: (context) => const AchivAdd(),
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
    );
  }
}

class AchivWidget extends StatefulWidget {
  const AchivWidget({
    super.key,
    required this.model,
  });
  final AchivHiveModel model;

  @override
  State<AchivWidget> createState() => _AchivWidgetState();
}

class _AchivWidgetState extends State<AchivWidget> {
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
