import 'package:calculadora_churrasco/widgets/seletor_quantidade.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variáveis para armazenar a quantidade de pessoas
  int quantidadeHomens = 0;
  int quantidadeMulheres = 0;
  int quantidadeCriancas = 0;

  // Variáveis para armazenar os resultados do cálculo
  String carne = '';
  String refrigerante = '';
  String cerveja = '';

  /// Função responsável por calcular a quantidade de itens necessários para o churrasco.
  /// Baseia-se em estimativas de consumo por tipo de pessoa.
  void calcular() {
    setState(() {
      // Cálculo da quantidade total de carne em Kg
      double totalCarne =
          quantidadeHomens * 0.5 + quantidadeMulheres * 0.35 + quantidadeCriancas * 0.2;
      // Cálculo da quantidade total de refrigerante em Litros
      double totalRefrigerante =
          quantidadeHomens * 0.2 + quantidadeMulheres * 0.350 + quantidadeCriancas * 0.1;
      // Cálculo da quantidade total de cerveja em Litros
      double totalCerveja = quantidadeHomens * 0.750 + quantidadeMulheres * 0.1;

      // Atualiza as strings de resultado com os valores calculados
      refrigerante = 'Refrigerante:  $totalRefrigerante L';
      cerveja = 'Cerveja:  $totalCerveja L';
      carne = 'Carne:  $totalCarne Kg';

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Título da AppBar com uma imagem
        title: Image.asset('churrasco.png'),
      ),
      // Corpo principal da tela
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Espaçamento entre os widgets da coluna
          spacing: 20, 
          children: <Widget>[
            // Seletor de quantidade para Homens
            SeletorQuantidade(
                label: 'Homens',
                onChanged: (newValue) => setState(() => quantidadeHomens = newValue)),
            // Seletor de quantidade para Mulheres
            SeletorQuantidade(
                label: 'Mulheres',
                onChanged: (newValue) => setState(() => quantidadeMulheres = newValue)),
            // Seletor de quantidade para Crianças
            SeletorQuantidade(
                label: 'Crianças',
                onChanged: (newValue) => setState(() => quantidadeCriancas = newValue)),
            const SizedBox(height: 40),
            // Exibe o resultado do cálculo da carne
            Text(carne, style: const TextStyle(fontSize: 20)),
            // Exibe o resultado do cálculo do refrigerante
            Text(refrigerante, style: const TextStyle(fontSize: 20)),
            // Exibe o resultado do cálculo da cerveja
            Text(cerveja, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 80),
            // Botão para acionar o cálculo
            ElevatedButton(onPressed: calcular, child: const Text('Calcular')),
          ],
        ),
      ),
    );
  }
}