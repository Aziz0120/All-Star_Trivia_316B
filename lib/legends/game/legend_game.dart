import 'dart:async';
import 'package:all_star_trivia_316_b/core/tri_colors.dart';
import 'package:all_star_trivia_316_b/legends/game/list.dart';
import 'package:all_star_trivia_316_b/legends/legends_cont.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LegendGame extends StatefulWidget {
  const LegendGame({super.key, required this.model, required this.indexGame});
  final LegendsModel model;
  final int indexGame;

  @override
  State<LegendGame> createState() => _LegendGameState();
}

class _LegendGameState extends State<LegendGame> {
  int currentIndex = 0;
  final CountDownController _controller = CountDownController();
  final int _duration = 15;
  late List<Map<String, dynamic>> jordanquestions = listAll[widget.indexGame];
  int score = 0;
  int? selectedOptionIndex;
  bool isAnswerChecked = false;
  bool isQuizCompleted = false;
  List<bool> answers = []; // Список для хранения результатов ответов

  @override
  void initState() {
    super.initState();
    // Инициализируем список результатов ответов
    answers = List.filled(jordanquestions.length, false);
  }

  void nextQuestion() {
    if (currentIndex < jordanquestions.length - 1) {
      setState(() {
        currentIndex++;
        _controller.restart(duration: _duration);
        selectedOptionIndex = null;
        isAnswerChecked = false;
      });
    } else {
      setState(() {
        isQuizCompleted = true;
      });
    }
  }

  void checkAnswer(int index, String selected) {
    if (isAnswerChecked) return;

    setState(() {
      selectedOptionIndex = index;
      isAnswerChecked = true;
    });

    bool isCorrect =
        jordanquestions[currentIndex]['answer'].trim() == selected.trim();
    if (isCorrect) {
      setState(() {
        score++;
      });
    }

    // Обновляем список результатов ответов
    answers[currentIndex] = isCorrect;

    _controller.pause();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        selectedOptionIndex = null;
        isAnswerChecked = false;
      });
      nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isQuizCompleted) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Basketball Legends',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Image.asset(widget.model.image),
                SizedBox(height: 16.h),
                Text(
                  'Your result: $score/${jordanquestions.length}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: jordanquestions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) => WidgetResults(
                    text: jordanquestions[index]['question'],
                    isAnswer: answers[index], // Передаём правильный результат
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: TriColors.tiffany,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: TriColors.bgCont,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      );
    }

    final question = jordanquestions[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basketball Legends',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            CircularCountDownTimer(
              duration: _duration,
              initialDuration: 0,
              controller: _controller,
              width: 0.w,
              height: 0.h,
              ringColor: const Color(0xff0B84FF).withOpacity(0.2),
              fillColor: const Color(0xff0B84FF),
              backgroundColor: const Color(0xff121212),
              strokeWidth: 4.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: true,
              onComplete: () {
                nextQuestion();
              },
            ),
            Image.asset(widget.model.image),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                '${currentIndex + 1}/${jordanquestions.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 21.h),
            Container(
              padding: EdgeInsets.all(20.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: TriColors.bgCont,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                question['question'],
                style: TextStyle(
                  color: TriColors.tiffany,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 3,
                ),
                itemCount: question['options'].length,
                itemBuilder: (context, index) {
                  final option = question['options'][index];
                  final isSelected = selectedOptionIndex == index;
                  return GestureDetector(
                    onTap: () => checkAnswer(index, option),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: TriColors.tiffany),
                        color: isSelected
                            ? TriColors.tiffany
                            : const Color(0xff000000),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color:
                              isSelected ? TriColors.bgCont : TriColors.tiffany,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class WidgetResults extends StatelessWidget {
  const WidgetResults({
    super.key,
    required this.text,
    required this.isAnswer,
  });
  final String text;
  final bool isAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1A1A24),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: const Color(0xff3BECE5),
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Image.asset(
              isAnswer
                  ? 'assets/icons/checkTrue.png'
                  : 'assets/icons/checkFalse.png',
              width: 20.w,
            ),
          )
        ],
      ),
    );
  }
}
