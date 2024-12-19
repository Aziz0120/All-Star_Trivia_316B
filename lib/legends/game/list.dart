import 'package:shared_preferences/shared_preferences.dart';

final List<Map<String, dynamic>> jordanquestions = [
  {
    'question': 'Is it true that Michael Jordan won all his finals series?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'Is it true that Jordan became the NBAs all-time scoring leader?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question':
        'Michael Jordan played baseball before returning to the NBA in 1995.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'Did Michael Jordan compete on the Olympic team known as the "Dream Team"?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is Michael Jordan a 5-time NBA Champion?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
];
final List<Map<String, dynamic>> jamesquestions = [
  {
    'question':
        'LeBron James has won an NBA championship with three different teams.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'Is it true that LeBron was the first overall pick in the 2004 draft?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'LeBron James became an Olympic champion twice.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'LeBron is known as "King James."',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'LeBron James made his NBA debut after graduating from university.',
    'options': ['False', 'True'],
    'answer': 'False',
  },
];
final List<Map<String, dynamic>> kobequestions = [
  {
    'question': 'Is it true that Kobe Bryant scored 81 points in one game?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'Kobe earned the nickname "Black Mamba" because of his speed on the court.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Kobe Bryant won six NBA championships with the Lakers.',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question':
        'Is Kobe Bryant the youngest player to play in the NBA when he debuted?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is it true that Kobe played for two teams in the NBA?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
];
final List<Map<String, dynamic>> onealquestions = [
  {
    'question': 'Is it true that Shaquille ONeal won four NBA championships?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Shaquille is known by his nickname "King James".',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question':
        'Shaquille ONeal played for the Miami Heat and Los Angeles Lakers.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Did Shaq break basketball backboards during games?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is it true that Shaq only won MVP of the season once?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
];
final List<Map<String, dynamic>> larryquestions = [
  {
    'question':
        'Is it true that Larry Bird won three championships with the Boston Celtics?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Larry Bird was a point guard.',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Bird won three straight MVP titles.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Larry Bird played for the Los Angeles Lakers.',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Is Larry Bird inducted into the Basketball Hall of Fame?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
];
final List<Map<String, dynamic>> kareemquestions = [
  {
    'question': 'Did Kareem Abdul-Jabbar invent the skyhook shot?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Is Kareem the all-time NBA points leader?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Did he play for the New York Knicks?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Kareem Abdul-Jabbar won six MVP awards.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is he a six-time NBA champion?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
];
final List<Map<String, dynamic>> magicquestions = [
  {
    'question': 'Did Magic Johnson win five NBA championships?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Magic Johnson played for the Boston Celtics.',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Is he a 3-time MVP?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Did Magic Johnson retire after his HIV diagnosis in 1991?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Was Magic part of the 1992 Olympic Dream Team?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
];
final List<Map<String, dynamic>> curryquestions = [
  {
    'question': 'Is Stephen Curry the all-time leader in three-pointers made?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Did Curry win an MVP award unanimously?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Has he won two NBA championships?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question':
        'Curry has played his entire career with the Los Angeles Lakers.',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Is Curry known for his long-range shooting?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
];
final List<Map<String, dynamic>> wiltquestions = [
  {
    'question': 'Did Wilt Chamberlain score 100 points in one game?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is Wilt a 4-time NBA champion?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Did he play for the Los Angeles Lakers?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'Wilt Chamberlain averaged over 50 points per game for an entire season.',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 's he known for being an MVP four times?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
];
final List<Map<String, dynamic>> kevinquestions = [
  {
    'question': 'Has Kevin Durant won two NBA championships?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is Durant a four-time scoring champion?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question':
        'Did Durant play his entire career with the Golden State Warriors?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
  {
    'question': 'Is Kevin Durant an Olympic gold medalist?',
    'options': ['False', 'True'],
    'answer': 'True',
  },
  {
    'question': 'Is Kevin Durant known for his rebounding skills primarily?',
    'options': ['False', 'True'],
    'answer': 'False',
  },
];
List listAll = [
  jordanquestions,
  jamesquestions,
  kobequestions,
  onealquestions,
  larryquestions,
  kareemquestions,
  magicquestions,
  curryquestions,
  wiltquestions,
  kevinquestions,
];

class SavedData {
  static Future<void> setLegendLikeList(List<String> count) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('LegendLikeList', count);
  }

  static Future<List<String>> getLegendLikeList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('LegendLikeList') ?? [];
  }
}
