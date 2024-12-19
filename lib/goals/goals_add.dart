import 'dart:io';
import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/core/tri_text_field.dart';
import 'package:all_star_trivia_316_b/core/trivia_btm.dart';
import 'package:all_star_trivia_316_b/goals/logic/goals_hive_model.dart';
import 'package:all_star_trivia_316_b/goals/logic/goals_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class GoalsAdd extends StatefulWidget {
  const GoalsAdd({super.key});

  @override
  State<GoalsAdd> createState() => _GoalsAddState();
}

class _GoalsAddState extends State<GoalsAdd> {
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();

  bool get continueColor {
    return (_controllerDescription.text.isNotEmpty &&
            _controllerName.text.isNotEmpty &&
            photo != null)
        ? true
        : false;
  }

  File? _image;
  Uint8List? _bytes;
  String? photo;

  Future pickImage() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return null;

      setState(() => _image = File(pickedFile.path));
      _bytes = _image!.readAsBytesSync();
      photo = String.fromCharCodes(_bytes!);
    } on PlatformException catch (e) {
      Text('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Personal achievements',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 34.h),
              InkWell(
                onTap: () {
                  setState(() {
                    pickImage();
                  });
                },
                child: _image == null
                    ? Container(
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
                              'assets/icons/addPhoto.png',
                              width: 40.w,
                              color: TriColors.tiffany,
                            ),
                            Text(
                              'Add photo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: TriColors.tiffany,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _image!,
                          width: double.infinity,
                          height: 124.h,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(height: 12.h),
              TriTextField(
                controller: _controllerName,
                onChanged: (p0) {
                  setState(() {});
                },
                hintText: 'Achievement name',
                maxLine: 3,
              ),
              SizedBox(height: 12.h),
              TriTextField(
                controller: _controllerDescription,
                onChanged: (p0) {
                  setState(() {});
                },
                hintText: 'Achievement Description',
                maxLine: 10,
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () async {
                  if (continueColor) {
                    GoalsHiveModel goalsHiveModel = GoalsHiveModel(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: _controllerName.text,
                      description: _controllerDescription.text,
                      image: photo!,
                    );
                    await GoalsRepoImpl().setGoals(goalsHiveModel);
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, s, ss) => const TriviaDownBar(
                          indexScr: 2,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        },
                      ),
                      (route) => false,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 62.h,
                  decoration: BoxDecoration(
                    color: continueColor
                        ? TriColors.tiffany
                        : TriColors.tiffany.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: TriColors.bgCont,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
