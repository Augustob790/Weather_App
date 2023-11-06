class StateException implements Exception {
  final String message;

  StateException({required this.message});

  StateException.generic()
      : message = 'Não foi possível retornar todos os estados.';
}
