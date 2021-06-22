import 'package:flutter/material.dart';
import 'package:CRONO/core/core.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/footer_widget.dart';

class PrivacidadePage extends StatefulWidget {
  @override
  _PrivacidadePageState createState() => _PrivacidadePageState();
}

class _PrivacidadePageState extends State<PrivacidadePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(),
                    SizedBox(width: 20),
                    Text(
                      "Termos de uso",
                      textAlign: TextAlign.left,
                      style: AppTextStyles.heading30,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text("1: SOBRE O TRATAMENTO DE DADOS PESSOAIS",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "CRONO é um aplicativo desenvolvido como trabalho de conclusão de curso pela Universidade Estácio de Sá do campus Nova América. Nossa Política de Privacidade visa esclarecer aos usuários do aplicativo como os dados pessoais serão tratados.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text("2: ABRANGÊNCIA",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Esta política abrange todos os titulares cujos dados pessoais sejam, em algum momento, objeto de tratamento de dados por parte do CRONO e engloba as operações internas e externas realizadas pelos desenvolvedores do mesmo.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text("3: CONCEITOS",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Existem termos e expressões que são citados nessa política e que seguem os conceitos definidos na legislação de proteção de dados pessoais. Você pode não estar familiarizado com o significado de todos eles. Então, relacionamos a seguir alguns esclarecimentos sobre os conceitos mais utilizados e que podem lhe auxiliar a compreender melhor o contexto dessa política de privacidade.\n\n• Dado pessoal: informação relacionada a pessoa natural identificada ou identificável;\n\n• Dado pessoal sensível: dado pessoal sobre origem racial ou étnica, convicção religiosa, opinião política, filiação a sindicato ou a organização de caráter religioso, filosófico ou político, dado referente à saúde ou à vida sexual, dado genético ou biométrico, quando vinculado a uma pessoa natural;\n\n• Banco de dados: conjunto estruturado de dados pessoais, estabelecido em um ou em vários locais, em suporte eletrônico ou físico;\n\n• Titular: pessoa física a quem se referem os dados pessoais que são objeto de tratamento;\n\n• Controlador: pessoa física ou jurídica, de direito público ou privado, a quem competem as decisões referentes ao tratamento de dados pessoais;\n\n• Operador: pessoa física ou jurídica, de direito público ou privado, que realiza o tratamento de dados pessoais em nome do controlador;\n\n• Encarregado de proteção de dados: pessoa indicada pelo controlador para atuar como canal de comunicação entre o controlador, os titulares dos dados e a Autoridade Nacional de Proteção de Dados;\n\n• Agentes de tratamento: o controlador e o operador;\n\n• Tratamento: toda operação realizada com dados pessoais, como as que se referem a coleta, produção, recepção, classificação, utilização, acesso, reprodução, transmissão, distribuição, processamento, arquivamento, armazenamento, eliminação, avaliação ou controle da informação, modificação, comunicação, transferência, difusão ou extração;\n\n• Anonimização: utilização de meios técnicos razoáveis e disponíveis no momento do tratamento, por meio dos quais um dado perde a possibilidade de associação, direta ou indireta, a um indivíduo;\n\n • Consentimento: manifestação livre, informada e inequívoca pela qual o titular concorda com o tratamento de seus dados pessoais para uma finalidade determinada;\n\n • Compartilhamento: comunicação, difusão, transferência internacional, interconexão de dados pessoais ou tratamento compartilhado de bancos de dados pessoais por órgãos e entidades públicos no cumprimento de suas competências legais, ou entre esses e entes privados, reciprocamente, com autorização específica, para uma ou mais modalidades de tratamento permitidas por esses entes públicos, ou entre entes privados;\n\n• Relatório de impacto à proteção de dados pessoais: documentação do controlador que contém a descrição dos processos de tratamento de dados pessoais que podem gerar riscos às liberdades civis e aos direitos fundamentais, bem como medidas, salvaguardas e mecanismos de mitigação de risco;\n\n• Autoridade Nacional de Proteção de Dados (ANPD): órgão responsável por zelar, implementar e fiscalizar o cumprimento da legislação de proteção de dados pessoais.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 10),
                          Text(
                            "Texto por AMBEV TECH. Política de Privacidade. [SI] [2021]. Disponível em: <https://ambevtech.com.br/politica-de-privacidade/> Acesso em: 08 de junho de 2021.",
                            style: AppTextStyles.small,
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 15),
                          Text("4: DADOS PESSOAIS TRATADOS PELO CRONO",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "O aplicativo CRONO pode, em algum momento, em função das atividades desempenhadas, coletar e tratar dados de pessoas físicas, de forma manual ou automatizada.\nSolicitamos e mantemos apenas os dados pessoais estritamente necessários para dar suporte às nossas operações do aplicativo. São dados pessoais de caráter cadastral, utilizados para identificação de usuários, como Nome, Data de nascimento, Estado, Tipo de cabelo, E-mail e Senha dos usuários. \n\nTais dados destinam-se a:\n\n•Controlar o acesso ao aplicativo;\n•Elaborar perfil com calendário customizado;\n\nEmbora não trate comumente tais dados os desenvolvedores do aplicativo se comprometem, no caso de, em algum momento necessitar realizar a coleta/utilização de dados de menores de idade, vir a fazê-lo somente através do devido consentimento, em conformidade com a lei.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text(
                              "5: BASES LEGAIS QUE LEGITIMAM O TRATAMENTO DE DADOS PESSOAIS",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Para poder realizar os tratamentos de dados pessoais em conformidade com a legislação, é preciso enquadrá-los em alguma das situações previstas no Art. 7º. da LGPD.\nConsiderando os dados tratados pelo CRONO, temos como fundamento as seguintes bases legais:\n\n• Cumprimento de obrigações legais ou regulatórias;\n• Execução de contratos ou procedimentos preliminares;\n• Legítimo interesse do controlador;\n• Exercício regular de direitos em processos arbitrais, judiciais ou administrativos;\n• Consentimento do titular dos dados pessoais;",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text(
                              "6: COMPARTILHAMENTOS E TRANSFERÊNCIAS DE DADOS PESSOAIS",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Podemos, em determinadas situações, realizar o compartilhamento ou a transferência de dados pessoais para terceiros, no âmbito externo do CRONO. Para tal, aplicamos as técnicas de segurança recomendadas, visando garantir a adequada proteção de dados, durante a realização de tais operações. Situação em que pode ocorrer o compartilhamento ou transferência de dados pessoais:\n\n• Envio de dados para órgãos governamentais, administrativos ou judiciais, para cumprimento de determinações legais ou judiciais, caso ocorram.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text("7: DIREITOS DOS TITULARES",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Os titulares de dados pessoais têm direito a receber informações claras e objetivas sobre o que está acontecendo com seus dados.\nSão direitos do titular:\n\n• Receber dos desenvolvedores do CRONO a informação da existência ou não de tratamento de dados pessoais de sua titularidade;\n• Conseguir ter acesso a tais dados; \n• Poder solicitar a correção dos dados incompletos, inexatos ou desatualizados através da página de Configurações;\n• Ter seus dados anonimizados, bloqueados ou eliminados, quando não mais necessários à finalidade para a qual foram obtidos, ou quando utilizados em inconformidade com a legislação, ao solicitar, na página de Configurações, a Desativação de conta juntamente com Exclusão de dados do Banco;\n• Saber com quem seus dados estão sendo compartilhados e para quais finalidades;\n• Registrar junto à ANPD, reclamações contra o controlador de seus dados pessoais.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text("8: BOAS PRÁTICAS DE GOVERNANÇA EM PRIVACIDADE",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Buscamos atuar sempre em conformidade com a legislação de proteção de dados pessoais. Porém, nenhuma instituição está isenta da ocorrência de incidentes com dados pessoais.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 15),
                          Text("9: TEMPO DE ARMAZENAGEM DOS DADOS PESSOAIS",
                              style: AppTextStyles.labelBold,
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Procuraremos manter armazenados os dados pessoais somente enquanto eles estiverem sendo utilizados, para cumprimento das finalidades estabelecidas e dentro da conformidade legal.\nSempre que possível providenciaremos a eliminação de dados pessoais não mais utilizados a partir do momento em que o usuário solicitar através da opção de desativação de conta e exclusão de dados na página de Configurações, ressalvados os casos em que, por força de lei ou regulamento, seja necessária sua guarda durante um período estabelecido.",
                              style: AppTextStyles.body,
                              textAlign: TextAlign.justify),
                          SizedBox(height: 10),
                          Text(
                            "O texto acima se baseia, conforme supracitado e creditado, na Política de Privacidade fornecido por AMBEV TECH. [SI] [05/2020]. Disponível em: <https://ambevtech.com.br/politica-de-privacidade/>. Acesso em: 08 de junho de 2021.",
                            style: AppTextStyles.small,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
