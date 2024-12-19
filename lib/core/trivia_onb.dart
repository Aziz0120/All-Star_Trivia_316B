// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/core/trivia_btm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TriviaOnbScreen extends StatefulWidget {
  const TriviaOnbScreen({super.key});

  @override
  State<TriviaOnbScreen> createState() => _TriviaOnbScreenState();
}

class _TriviaOnbScreenState extends State<TriviaOnbScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgOnb.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Expanded(
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      currantPage = value;
                    });
                  },
                  children: const [
                    KeepBWidget(
                      subTitle: 'Choose a player',
                      image: 'assets/images/onbrr1.png',
                    ),
                    KeepBWidget(
                      subTitle: 'Take the test',
                      image: 'assets/images/onbrr2.png',
                    ),
                    KeepBWidget(
                      subTitle: 'Add to favorites',
                      image: 'assets/images/onbrr3.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  if (currantPage == 2) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TriviaDownBar(),
                      ),
                      (protected) => false,
                    );
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.r),
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                      color: TriColors.tiffany,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}

class KeepBWidget extends StatelessWidget {
  const KeepBWidget({
    super.key,
    required this.subTitle,
    required this.image,
  });

  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Image.asset(image),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
