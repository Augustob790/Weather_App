enum ClinaEnum {
  north(name: 'Norte'),
  northeast(name: 'Nordeste'),
  south(name: 'Sul'),
  southeast(name: 'Sudeste'),
  midwest(name: 'Centro-oeste');

  const ClinaEnum({required this.name});

  final String name;
}
