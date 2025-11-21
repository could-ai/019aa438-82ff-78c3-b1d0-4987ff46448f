import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/product_result.dart';

class ResultScreen extends StatelessWidget {
  final ProductResult product;

  const ResultScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Produto Gerado'),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Color(0xFFBB86FC),
            labelColor: Color(0xFFBB86FC),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Visão Geral'),
              Tab(text: 'Estrutura'),
              Tab(text: 'Design & Variações'),
              Tab(text: 'Extras & Bônus'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOverviewTab(context),
            _buildStructureTab(context),
            _buildDesignTab(context),
            _buildExtrasTab(context),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Exportando PDF... (Simulação)')),
            );
          },
          icon: const Icon(Icons.download),
          label: const Text('Exportar PDF'),
          backgroundColor: const Color(0xFF03DAC6),
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader('PRODUTO DIGITAL'),
        const SizedBox(height: 10),
        Text(
          product.title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        Text(
          product.subtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFFBB86FC),
                fontStyle: FontStyle.italic,
              ),
        ),
        const SizedBox(height: 24),
        _buildInfoCard(context, 'Resumo', product.summary, Icons.description),
        _buildInfoCard(context, 'Objetivo', product.objective, Icons.flag),
        _buildInfoCard(context, 'Público-Alvo', product.targetAudience, Icons.group),
      ],
    );
  }

  Widget _buildStructureTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader('ESTRUTURA DO CURSO/PRODUTO'),
        const SizedBox(height: 16),
        ...product.structure.map((module) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: const Icon(Icons.folder, color: Color(0xFFBB86FC)),
                title: Text(module, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            )),
        const SizedBox(height: 24),
        _buildSectionHeader('CONTEÚDO DESENVOLVIDO'),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Text(
            product.contentPreview,
            style: const TextStyle(height: 1.5, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildDesignTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader('IDENTIDADE VISUAL SUGERIDA'),
        const SizedBox(height: 16),
        _buildInfoCard(context, 'Design System', product.designSuggestion, Icons.palette),
        const SizedBox(height: 24),
        _buildSectionHeader('VARIAÇÕES DO PRODUTO'),
        const SizedBox(height: 16),
        ...product.variations.map((variation) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              color: const Color(0xFF252525),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.swap_horiz, color: Color(0xFF03DAC6)),
                    const SizedBox(width: 16),
                    Expanded(child: Text(variation)),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildExtrasTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSectionHeader('BÔNUS INCLUÍDOS'),
        const SizedBox(height: 16),
        ...product.bonuses.map((bonus) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.card_giftcard, color: Color(0xFFFFD700)),
              title: Text(bonus),
            )),
        const Divider(height: 40),
        _buildSectionHeader('MELHORIAS FUTURAS'),
        const SizedBox(height: 16),
        ...product.improvements.map((imp) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.trending_up, color: Color(0xFF03DAC6)),
              title: Text(imp),
            )),
        const Divider(height: 40),
        _buildSectionHeader('SERVIÇOS EXTRAS GERADOS'),
        const SizedBox(height: 16),
        ...product.extraServices.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.key.toUpperCase(), style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ...entry.value.map((val) => Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 16, color: Color(0xFFBB86FC)),
                    const SizedBox(width: 8),
                    Text(val),
                  ],
                ),
              )),
              const SizedBox(height: 16),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF03DAC6),
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        fontSize: 12,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: const Color(0xFFBB86FC)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(
                color: Colors.grey[300],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
