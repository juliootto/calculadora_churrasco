import 'package:flutter/material.dart';

/// Um widget que permite ao usuário selecionar uma quantidade através de botões de incremento e decremento.
///
/// Ele exibe um rótulo e um contador numérico que pode ser ajustado.
class SeletorQuantidade extends StatefulWidget {
  /// O texto que aparecerá como rótulo para este seletor.
  final String label;

  /// O valor inicial do contador quando o widget é criado.
  /// O padrão é 0.
  final int initialValue;

  /// O valor mínimo que o contador pode atingir.
  /// O botão de decremento será desabilitado se o valor atual for igual a este mínimo.
  /// O padrão é 0.
  final int minValue;

  /// Uma função de callback que é chamada sempre que o valor do contador muda.
  /// O novo valor é passado como argumento para esta função, permitindo que o widget pai
  /// reaja às mudanças.
  final ValueChanged<int> onChanged;

  const SeletorQuantidade({
    super.key,
    required this.label,
    required this.onChanged,
    this.initialValue = 0,
    this.minValue = 0,
  });

  @override
  State<SeletorQuantidade> createState() => _SeletorQuantidadeState();
}

class _SeletorQuantidadeState extends State<SeletorQuantidade> {
  /// Estado interno que armazena o valor atual do contador.
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    // Inicializa o valor atual com o valor inicial fornecido pelo widget pai.
    _currentValue = widget.initialValue;
  }

  /// Incrementa o valor do contador em 1.
  ///
  /// Notifica o widget pai sobre a mudança através do callback `onChanged`.
  void _increment() {
    setState(() {
      _currentValue++;
      widget.onChanged(_currentValue);
    });
  }

  /// Decrementa o valor do contador em 1, desde que não seja menor que `minValue`.
  ///
  /// Notifica o widget pai sobre a mudança através do callback `onChanged`.
  void _decrement() {
    // Só decrementa se o valor atual for maior que o valor mínimo permitido.
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        // Notifica o widget pai sobre a mudança
        widget.onChanged(_currentValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // O rótulo customizável para o seletor de quantidade.
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ), // O seletor de quantidade com botões de incremento e decremento.
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Faz a Row ocupar o mínimo de espaço
            children: [
              // Botão para decrementar o valor.
              IconButton(
                icon: const Icon(Icons.remove),
                // Desabilita o botão se o valor atual for igual ao valor mínimo permitido.
                onPressed: _currentValue > widget.minValue ? _decrement : null,
                color: Colors.red,
              ),
              // Divisor vertical para estética
              Container(
                width: 1,
                height: 32,
                color: Colors.grey.shade300,
              ),
              // Exibe o valor numérico atual do contador.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  '$_currentValue',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 32,
                color: Colors.grey.shade300,
              ),
              // Botão para incrementar o valor.
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _increment,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}