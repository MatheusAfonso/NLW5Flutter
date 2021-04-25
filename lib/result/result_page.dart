import 'package:devquiz/challenge/widgets/nextbutton/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int rightAnswersCount;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.rightAnswersCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.trophy,
            ),
            Column(children: [
              Text(
                "Parabéns!",
                style: AppTextStyles.heading40,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Você concluiu",
                style: AppTextStyles.body,
              ),
              Text(
                "$title",
                style: AppTextStyles.bodyBold,
              ),
              Text(
                "com $rightAnswersCount de $length acertos.",
                style: AppTextStyles.body,
              ),
            ]),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'Eu consegui $rightAnswersCount de $length respostas corretas no quiz $title!');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: NextButtonWidget.transparent(
                          label: "Início",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
