
class BotModel{
  final int id;
  final String title;
  final String subtitle;
  String name;

  BotModel({
    required this.id,
    required this.title,
    required this.subtitle,
    this.name = 'Distribution Bot',
  });
}

List data = [
  BotModel(id: 0, title: 'EMA Cross 50  200 + ADX', subtitle: '(Long)',),
  BotModel(id: 1, title: 'EMA Cross 50  200 + ADX', subtitle: '(Long)',),
  BotModel(id: 2, title: 'EMA Cross 50  200 + ADX', subtitle: '(Long)',),
];