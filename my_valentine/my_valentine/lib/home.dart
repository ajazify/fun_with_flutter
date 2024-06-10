import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isButtonVisible = true;
  bool _isSucessScafold = false;
  final Random _random = Random();
  double _left = 100.0;
  double _top = 100.0;

  void _sucessScafold() {
    setState(() {
      _isSucessScafold = !_isSucessScafold;
    });
  }

  void _moveButton() {
    // Generate random positions
    setState(() {
      _left = _random.nextDouble() * (MediaQuery.of(context).size.width - 100);
      _top = _random.nextDouble() * (MediaQuery.of(context).size.height - 100);
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isButtonVisible = !_isButtonVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSucessScafold
        ? const Scaffold(
            body: Center(
              child: Text('Awww.. You are Mine Now!'),
            ),
          )
        : Scaffold(
            body: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text('Will you be my valentine ♡ ? '),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 80,
                            child: OutlinedButton(
                                onPressed: () {
                                  _sucessScafold();
                                },
                                child: const Text('Yes'))),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          replacement: const SizedBox(
                            width: 80,
                          ),
                          visible: _isButtonVisible,
                          child: SizedBox(
                            width: 80,
                            child: OutlinedButton(
                                onPressed: () {
                                  _toggleVisibility();
                                },
                                child: const Text('No')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    left: _left,
                    top: _top,
                    child: Visibility(
                      visible: !_isButtonVisible,
                      child: OutlinedButton(
                          onPressed: () {
                            _moveButton();
                          },
                          child: const Text('No')),
                    )),
              ],
            ),
          ));
  }
}
