import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Settings',
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
              height: 140.h,
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
                  Text(
                    'More new basketball players\ncoming soon',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: TriColors.tiffany,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                triviaWeb(context,
                    'https://docs.google.com/document/d/1VHzuyWO6znPcDsvDMkHwsMXpwflt6kOHsKUSZHL6nK8/edit?usp=sharing');
              },
              child: Container(
                width: double.infinity,
                height: 67.h,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 40.w),
                    Text(
                      'Privacy Policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.tiffany,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/goal.png',
                      width: 40.w,
                      color: TriColors.tiffany,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () {
                triviaWeb(context,
                    'https://docs.google.com/document/d/1_9JQU3rovQ1rnbmD98o_tz1Om-140xCIvR5s37OQHvA/edit?usp=sharing');
              },
              child: Container(
                width: double.infinity,
                height: 67.h,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 40.w),
                    Text(
                      'Terms of Use',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.tiffany,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/goal.png',
                      width: 40.w,
                      color: TriColors.tiffany,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () {
                triviaWeb(context, 'https://form.jotform.com/243530975446463');
              },
              child: Container(
                width: double.infinity,
                height: 67.h,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 40.w),
                    Text(
                      'Support',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.tiffany,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/goal.png',
                      width: 40.w,
                      color: TriColors.tiffany,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () {
                Share.share(
                    'https://apps.apple.com/us/app/all-star-trivia/id6739612607');
              },
              child: Container(
                width: double.infinity,
                height: 67.h,
                decoration: BoxDecoration(
                  color: TriColors.bgCont,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 40.w),
                    Text(
                      'Share',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.tiffany,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/goal.png',
                      width: 40.w,
                      color: TriColors.tiffany,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void triviaWeb(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
      ),
    );
  }
}
