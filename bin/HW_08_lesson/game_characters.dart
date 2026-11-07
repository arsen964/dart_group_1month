import 'rpg_game.dart';

enum SuperAbility {
  heal,
  boost,
  criticalDamage,
  blockRevert,
  shield,
  dodge,
  resurrect,
  stun,
  diceRoll,
}

abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  set health(int value) {
    if (value < 0) {
      _health = 0;
    } else {
      _health = value;
    }
  }

  int get health => _health;

  GameCharacter(this.name, this._health, this.damage);

  bool isAlive() {
    return health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length); // 0,1,2,3
    defence = variants[randomIndex];
  }

  void attack(List<Hero> heroes) {
    Golem? aliveGolem;
    for (Hero h in heroes) {
      if (h is Golem && h.isAlive()) {
        aliveGolem = h;
        break;
      }
    }
    for (Hero h in heroes) {
      if (h.isAlive()) {
        int currentdamage = damage;
        if (aliveGolem != null && h != aliveGolem) {
          int golemPart = currentdamage ~/ 5; // 20%

          aliveGolem.health -= golemPart;
          currentdamage -= golemPart;
          if (!aliveGolem.isAlive()) {
            print('Golem ${aliveGolem.name} is dead');
            aliveGolem = null;
          }
        }
      }
      if (h is Lucky) {
        if (RpgGame.random.nextInt(100) < 25) {
          print('Lucky ${h.name} dodged the attack');
        } else {
          h.health -= damage;
        }
      }

      if (h is Berserk && defence != SuperAbility.blockRevert) {
        int block = (RpgGame.random.nextInt(2) + 1) * 5; // 5,10
        h.blockedDamage = block;
        int finalDamage = damage - block;
        if (finalDamage < 0) {
          finalDamage = 0;
        }
        h.health -= finalDamage;
      } else {
        h.health -= damage;
      }
    }
  }

  @override
  String toString() {
    if (defence == null) {
      return '${super.toString()} defence: No defence';
    } else {
      return '${super.toString()} defence: ${defence!.name}, Stunned: $isStunned';
    }
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage; // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    {
      for (Hero h in heroes) {
        if (RpgGame.roundNumber <= 4)
          if (h.isAlive() && h != this) {
            int boost = (RpgGame.random.nextInt(5) + 1); // 1,2,3,4,5
            h.damage += boost;
            print('Magic $name boosted ${h.name} damage by $boost');
          }
      }
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;

  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
  }
}

class Healer extends Hero {
  int healPoints;

  Healer(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (Hero h in heroes) {
      if (h.isAlive() && h != this) {
        h.health += healPoints;
      }
    }
  }
}

class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  bool resurrectedHero = false;
  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.resurrect);

  @override
  void attack(Boss boss) {
    print('$name cannot attack');
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (this.isAlive() && !resurrectedHero) {
      Hero? deadHero;
      for (Hero h in heroes) {
        if (!h.isAlive()) {
          deadHero = h;
          break;
        }
      }

      if (deadHero != null) {
        deadHero.health = this.health;
        this.health = 0;
        resurrectedHero = true;

        print(
          'Witcher $name sacrificed himself to resurrect ${deadHero.name} with ${deadHero.health} HP!',
        );
      }
    }
  }
}

class Thor extends Hero {
  Thor(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('$name Stunned Boss');
    }
  }
}

class Ludoman extends Hero {
  Ludoman(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.diceRoll);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int dice1 = RpgGame.random.nextInt(6) + 1;
    int dice2 = RpgGame.random.nextInt(6) + 1;

    print('$name rolls two dice: $dice1 and $dice2');

    if (dice1 == dice2) {
      int damage = dice1 * dice2;
      boss.health -= damage;

      print('The numbers match!');
      print('$name dealt $damage damage to the Boss.');
    } else {
      List<Hero> aliveHeroes = [];

      for (Hero h in heroes) {
        if (h.isAlive() && h != this) {
          aliveHeroes.add(h);
        }
      }

      if (aliveHeroes.isEmpty) {
        print('There are no allies to attack!');
        return;
      }

      Hero randomHero = aliveHeroes[RpgGame.random.nextInt(aliveHeroes.length)];

      int damage = dice1 + dice2;
      randomHero.health -= damage;

      print('The numbers do not match!');
      print('$name dealt $damage damage to ${randomHero.name}.');
    }
  }
}
