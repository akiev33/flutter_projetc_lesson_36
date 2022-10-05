import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_projetc_lesson_36/list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewBuilder extends StatefulWidget {
  const PageViewBuilder({super.key});

  @override
  State<PageViewBuilder> createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  late final PageController controller;
  bool showNextButton = true;
  bool showBackButton = true;

  @override
  void initState() {
    controller = PageController()
      ..addListener(() {
        if ((controller.page ?? 0) > 0.5) {
          showNextButton = false;
          showBackButton = true;
        } else {
          showNextButton = true;
          showBackButton = false;
        }
        log(controller.page.toString());
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (showNextButton)
            TextButton(
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
        ],
        leading: Column(
          children: [
            if (showBackButton)
              TextButton(
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: PageView.builder(
              itemCount: item.length,
              controller: controller,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: Image.asset(item[index].image),
                          width: double.infinity,
                        ),
                        const SizedBox(height: 114),
                        Text(
                          item[index].title,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          item[index].subtitle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: item.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              // strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }
}
