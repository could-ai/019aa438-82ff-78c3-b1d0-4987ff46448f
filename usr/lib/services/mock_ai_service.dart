import 'package:couldai_user_app/models/product_result.dart';

class MockAIService {
  // Simulates the AI processing delay and returns a structured response
  // based on the user's prompt persona.
  static Future<ProductResult> generateProduct(String command) async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate "Thinking"

    // This is a static mock response demonstrating what the AI would output
    // if connected to the LLM with the user's specific system prompt.
    return ProductResult(
      title: "Masterclass: $command",
      subtitle: "O Guia Definitivo para Dominar $command em 30 Dias",
      summary: "Um produto digital completo focado em transformar iniciantes em especialistas na área de $command. O material combina teoria aprofundada com exercícios práticos diários.",
      objective: "Capacitar o aluno a executar $command com excelência, fornecendo ferramentas, templates e estratégias validadas pelo mercado.",
      targetAudience: "Empreendedores, profissionais liberais e estudantes que desejam alavancar sua carreira ou negócio utilizando $command.",
      structure: [
        "Módulo 1: Fundamentos Essenciais",
        "Módulo 2: Estratégias Avançadas",
        "Módulo 3: Ferramentas e Automação",
        "Módulo 4: Estudo de Caso e Aplicação Real",
        "Módulo 5: Escala e Monetização"
      ],
      contentPreview: "No Módulo 1, abordaremos os conceitos base. A aula 1.1 foca na mentalidade necessária. A aula 1.2 apresenta o panorama atual do mercado. O conteúdo é entregue em formato de vídeo-aulas curtas (15min) acompanhadas de PDFs resumos.",
      designSuggestion: "Estilo Minimalista e Tech. Cores principais: Azul Marinho (#0A192F) e Dourado (#FFD700) para passar autoridade e valor. Tipografia: Montserrat para títulos e Open Sans para corpo de texto.",
      variations: [
        "Opção A: E-book Compacto (Guia Rápido de 50 páginas)",
        "Opção B: Workshop Ao Vivo de 4 horas (Imersão)",
        "Opção C: Mentoria em Grupo (4 encontros semanais)"
      ],
      bonuses: [
        "Bônus 1: Comunidade Exclusiva no Discord",
        "Bônus 2: Pack de Templates Editáveis no Canva",
        "Bônus 3: Planilha de Gestão Financeira para o Projeto"
      ],
      improvements: [
        "Futuramente, adicionar um módulo sobre Inteligência Artificial aplicada a $command.",
        "Criar uma certificação oficial ao final do curso.",
        "Traduzir o material para Espanhol e Inglês para expansão internacional."
      ],
      extraServices: {
        "Marketing": [
          "Landing Page de Alta Conversão",
          "Sequência de E-mails de Aquecimento",
          "Criativos para Facebook Ads"
        ],
        "Técnico": [
          "Fluxograma da Jornada do Usuário",
          "Setup da Área de Membros"
        ]
      },
    );
  }
}
