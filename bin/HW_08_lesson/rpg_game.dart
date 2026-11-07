import 'game_characters.dart';

import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    Boss boss = Boss('Dragon', 1000, 50);

    Warrior warrior1 = Warrior('Ahiles', 280, 15);
    Warrior warrior2 = Warrior('Hercules', 290, 10);
    Magic magic = Magic('Stange', 270, 15);
    Berserk berserk = Berserk('Axe', 260, 10);
    Healer doc = Healer('Jake', 150, 5, 15);
    Healer assistant = Healer('Junior', 180, 5, 5);
    Golem golem = Golem('Frank', 300, 5);
    Lucky lucky = Lucky('Spinner', 240, 10);
    Witcher witcher = Witcher('Geralt', 200, 0);
    Thor thor = Thor('Ragnarek', 200, 20);
    Ludoman ludoman = Ludoman('Peter Parker', 200, 15);

    List<Hero> heroes = [
      warrior1,
      doc,
      magic,
      berserk,
      warrior2,
      assistant,
      golem,
      lucky,
      witcher,
      thor,
      ludoman
    ];

    _showStatistics(boss, heroes);
    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static void _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber =========================');
    print(boss);
    for (Hero h in heroes) {
      print(h);
    }
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    boss.attack(heroes);

    if (boss.isStunned) {
      boss.isStunned = true;
      print('Boss skip round');
    } else {
      boss.attack(heroes);
    }

    for (Hero h in heroes) {
      if (h.isAlive() && boss.isAlive() && h.ability != boss.defence) {
        h.attack(boss);
        h.applySuperPower(boss, heroes);
      }
    }
    _showStatistics(boss, heroes);
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (Hero h in heroes) {
      if (h.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }
}
