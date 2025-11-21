import 'package:flutter/material.dart';
import 'package:couldai_user_app/services/mock_ai_service.dart';
import 'package:couldai_user_app/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _commandController = TextEditingController();
  bool _isGenerating = false;
  
  // Checkbox states for extra services
  bool _includeLandingPage = false;
  bool _includeCopywriting = false;
  bool _includeMarketingPlan = false;

  void _generateProduct() async {
    if (_commandController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, digite um comando ou ideia.')),
      );
      return;
    }

    setState(() {
      _isGenerating = true;
    });

    try {
      // Call the mock service
      final result = await MockAIService.generateProduct(_commandController.text);

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(product: result),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao gerar produto: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CouldAI Creator'),
        actions: [
          IconButton(icon: const Icon(Icons.history), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildInputSection(),
            const SizedBox(height: 24),
            _buildExtraServices(),
            const SizedBox(height: 40),
            _buildGenerateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'O que vamos criar hoje?',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Transforme uma ideia simples em um produto digital completo com nossa IA avançada.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[400],
              ),
        ),
      ],
    );
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SEU COMANDO',
          style: TextStyle(
            color: Color(0xFFBB86FC),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _commandController,
          maxLines: 4,
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(
            hintText: 'Ex: Curso de culinária vegana para iniciantes...',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildExtraServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SERVIÇOS ADICIONAIS (IA)',
          style: TextStyle(
            color: Color(0xFFBB86FC),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              CheckboxListTile(
                title: const Text('Landing Page Completa'),
                value: _includeLandingPage,
                activeColor: const Color(0xFFBB86FC),
                onChanged: (val) => setState(() => _includeLandingPage = val!),
              ),
              const Divider(height: 1, color: Colors.grey),
              CheckboxListTile(
                title: const Text('Copywriting de Vendas'),
                value: _includeCopywriting,
                activeColor: const Color(0xFFBB86FC),
                onChanged: (val) => setState(() => _includeCopywriting = val!),
              ),
              const Divider(height: 1, color: Colors.grey),
              CheckboxListTile(
                title: const Text('Plano de Marketing & Funil'),
                value: _includeMarketingPlan,
                activeColor: const Color(0xFFBB86FC),
                onChanged: (val) => setState(() => _includeMarketingPlan = val!),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenerateButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isGenerating ? null : _generateProduct,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFBB86FC),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isGenerating
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('Processando com IA...'),
                ],
              )
            : const Text(
                'GERAR PRODUTO DIGITAL',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
