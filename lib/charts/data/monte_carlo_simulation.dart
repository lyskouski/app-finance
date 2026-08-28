// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

class MonteCarloSimulation {
  final Random random = Random();
  final int cycles;
  final double coercion;

  MonteCarloSimulation({this.cycles = 30, this.coercion = 1});

  List<Offset> generate(List<Offset> scope, double step, double max) {
    final List<List<double>> distribution = [];
    for (int i = 0; i < scope.length; i++) {
      final state = mcNormal(scope[i].dy, coercion, cycles);
      for (int j = 0; j < state.length; j++) {
        if (j >= distribution.length) {
          distribution.add([]);
        }
        distribution[j].add(state[j]);
      }
    }
    double posX = scope.last.dx + step;
    List<Offset> result = [];
    int idx = 0;
    while (posX <= max) {
      result.add(Offset(posX, distribution[idx][distribution[idx].length * random.nextDouble() ~/ 1]));
      posX += step;
      idx++;
    }
    return result;
  }

  List<double> mcNormal(double mean, double stdDev, int samples) {
    List<double> results = [];
    for (int i = 0; i < samples; i++) {
      results.add(_normalRandom(mean, stdDev));
    }
    return results;
  }

  double _normalRandom(double mean, double stdDev) {
    double u1 = random.nextDouble();
    double u2 = random.nextDouble();
    double z0 = sqrt(-2.0 * log(u1)) * cos(2 * pi * u2);
    return mean + stdDev * z0;
  }
}
