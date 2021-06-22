import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:CRONO/core/app_text_styles.dart';
import 'package:CRONO/shared/widgets/button_widget.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Saiba mais",
                    textAlign: TextAlign.left,
                    style: AppTextStyles.heading30,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Sobre o Cronograma Capilar",
                            style: AppTextStyles.contentTitleBold,
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text(
                            "O cronograma capilar é um tipo de tratamento de hidratação intensivo que pode ser feito em casa ou no salão de beleza sendo particularmente indicado para pessoas com cabelos danificados ou cacheados que desejam um cabelo saudável e hidratado, sem ter que recorrer a produtos químicos, e sem haver necessidade de realizar alisamentos, permanentes, da escova e da prancha.\nEsse cronograma dura 1 mês e logo no fim da primeira semana pode-se notar uma grande diferença no antes e depois do cabelo, porque ele fica muito mais macio, hidratado e com brilho, mesmo no dia seguinte de ter feito a hidratação, nutrição ou reconstrução.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("Como fazer",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text(
                            "O cronograma capilar pode ser feito de acordo com as características dos fios e o que necessita para se manter nutrido. Uma boa forma de saber se seu cabelo precisa de hidratação, nutrição ou reconstrução é fazendo o teste da porosidade do fio, colocando um fio de cabelo dentro de um copo com água. Se o fio boiar, ele precisa de hidratação, se ficar no meio significa que precisa de nutrição e se afundar precisa de reconstrução. Veja mais sobre o teste de porosidade do fio.\nAssim, de acordo com as características e necessidades do cabelo, pode-se fazer o cronograma, em que o cabelo deve ser lavado 3 vezes por semana, e em cada lavagem deve ser realizado um dos tratamentos que melhoram a aparência dos fios.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("Por quanto tempo fazer o cronograma capilar ",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text(
                            "O cronograma capilar pode ser realizado por até 6 meses, sendo possível parar durante 1 mês, onde basta usar shampoo, condicionar e creme para pentear, caso ache necessário, e depois pode-se retornar ao cronograma. Algumas pessoas não tem necessidade de parar a cronograma porque o cabelo não fica pesado, nem oleoso. Caso isso aconteça pode ser preciso mudar os produtos e um cabeleireiro poderá indicar em que fase o seu cabelo está e qual o cronograma mais indicado para suas necessidades.\nO ideal é que o cronograma de hidratação seja mantido por longos períodos porque é a melhor forma de manter o cabelo bonito e hidratado, com fios sem frizz ou pontas duplas. Uma boa indicação de que o tratamento está dando certo é não sentir a necessidade de cortar o cabelo, nem mesmo as pontas.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("Quando os resultados podem ser vistos",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.center),
                        SizedBox(height: 10),
                        Text(
                            "Normalmente no primeiro mês do cronograma capilar pode-se notar uma boa diferença no cabelo, que fica muito mais bonito, hidratado e sem frizz. No entanto, quando o cabelo está muito danificado devido ao uso de químicas como progressiva, relaxamento ou permanente, os melhores resultados podem ser vistos no segundo mês de tratamento.\nQuem está passando pela transição capilar e não deseja mais alisar os fios artificialmente pode demorar de 6 a 8 meses para conseguir que seu cabelo fique completamente hidratado e com boa definição dos cachos, sem ter que recorrer a produtos químicos. Mas isso só é possível se além do cronograma, existirem cuidados diários com os fios.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 10),
                        Text(
                          "Texto por Tua Saúde. [SI] [05/2020]. Disponível em: <https://www.tuasaude.com/cronograma-capilar/> Acesso em: 08 de junho de 2021.",
                          style: AppTextStyles.small,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Sobre Teste de Porosidade",
                            style: AppTextStyles.contentTitleBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "O teste de porosidade avalia se as suas cutículas – responsáveis por proteger a fibra capilar – estão muito abertas ou fechadas. Na sequência, entenda o que isso significa e saiba como fazer esse exame para aprimorar os cuidados com as madeixas.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("O que é o teste da porosidade capilar?",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "A porosidade é a capacidade do cabelo de absorver líquidos. Logo, isso impacta diretamente na quantidade de produto que é aproveitada ou perdida pelos fios.\nSe o seu cabelo está com aparência seca, há grande chances dele ser altamente poroso. Ao tocar nele, é provável que você tenha a sensação de um fio pouco macio e muito frágil.\nA baixa porosidade e a média, por sua vez, não são tão simples de perceber a olho nu. Isso ocorre pois nos dois casos o cabelo tem aparência saudável. Porém, o mais recomendado é ter cabelos com média porosidade.\nPortanto, caso você queira saber qual é o real estado das suas madeixas, uma possibilidade é fazer o teste de porosidade. Ele pode diagnosticar se suas cutículas estão abertas ou fechadas.\nO exame consiste em separar um fio de cabelo e deixá-lo em repouso na água. Entretanto, apesar de muito realizado, é importante salientar que o teste pode apresentar algumas inconsistências.\nIsso acontece porque as nossas madeixas sofrem influência de shampoos, condicionadores, cremes e finalizadores, além do clima e da alimentação. Por isso, esse exame sempre terá um grau de erro, já que ele não consegue analisar o cabelo sem nenhum fator ambiental.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("Como fazer o teste?",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "Agora que você já sabe qual é a relação entre a porosidade e a saúde do cabelo, aprenda a fazer o teste caseiro.\nPrimeiramente, lave bem os fios e os penteie.\n\nEm segundo lugar, deixe o cabelo secar naturalmente, e não passe um creme finalizador.\n\nEm seguida, pegue um fio de cabelo (pode ser o que está na escova ou no pente) e coloque-o num copo com água filtrada.\nEntão, aguarde 10 minutos e veja a posição do cabelo no copo.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text(
                            "Analisando os resultados do teste de porosidade capilar",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "Por fim, compreenda o que significa cada resultado do teste de porosidade, e saiba como tratar os seus fios.\n\n\n•  Cabelo no fundo do copo\nAltamente poroso, ou seja, as cutículas estão abertas e o fio está com danos. Opte, portanto, por um corte de cabelo. Outra dica é adotar um cronograma capilar e fazer hidratações poderosas para reconstruir os fios.\n\n•  Cabelo no meio do copo\nPorosidade média. Isso indica que os seus fios estão saudáveis e são capazes de recolher os tratamentos oferecidos. Mantenha os cuidados com a nutrição.\n\n•  Cabelo no alto do copo ou boiando\nFio pouco poroso. Apesar da aparência do cabelo ser provavelmente de saudável, este tipo de cutícula não absorve muita água nem nutrientes.\n\n\nPortanto, para reverter este quadro e hidratar os fios, o cronograma capilar também é um aliado, assim como o Low Poo, para as cacheadas e crespas.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 10),
                        Text(
                          "Texto por Jornal DCI. [SI] [10/2020]. Disponível em: <https://www.dci.com.br/industria/beleza/teste-da-porosidade-capilar/22310/> Acesso em: 08 de junho de 2021.",
                          style: AppTextStyles.small,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Sobre Low Poo",
                            style: AppTextStyles.contentTitleBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "Você sabe o que significa low poo? O termo é a junção da palavra inglesa “low” (que significa pouco) e “poo” (que deriva de shampoo). O princípio dessa técnica é simples: reduzir a quantidade de shampoo usada na lavagem dos cabelos e, por consequência, de substâncias agressivas aos fios.\nA cabeça por trás dessa ideia pertence à Lorraine Massey, que escreveu O Manual da Garota Cacheada. Seu objetivo era desenvolver uma rotina de cuidados com os cabelos cacheados que fosse, ao mesmo tempo, rápida e com bons resultados. Afinal, esse tipo de fio costuma exigir mais atenção. Além do livro, Lorraine lançou também uma linha própria de produtos, a Deva Curl.\nMas vale dizer que o low poo não é exclusividade das cacheadas. Se você quer deixar seu cabelo mais saudável, além de investir em vitaminas e hidratações caseiras, pode começar a utilizar esse método de lavagem. A técnica garante fios mais fortes e leves. Enquanto isso, os cachos ficam mais definidos e hidratados.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("Para que serve a técnica Low Poo?",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "O grande segredo do low poo é, sem dúvida, o fato de permitir o uso de produtos apenas com baixa concentração de sulfato. Esse ingrediente aparece com frequência na composição dos shampoos porque tem alto poder de limpeza. Além disso, é responsável pela produção de espuma.\nPorém, em excesso, o sulfato altera o pH da fibra capilar, danificando o cabelo. Ele fica ressecado, quebradiço e sem brilho. Na técnica low poo, entretanto, os produtos liberados têm baixa ou nenhuma quantidade dessa substância (ou usam versões mais leves), mas ainda são capazes de limpar tanto os fios quanto o couro cabeludo.\nIsso é ótimo principalmente para cabelos que passam por processos químicos, como coloração e alisamentos, por exemplo.\nJá no caso dos cabelos cacheados, o formato curvilíneo impede que a oleosidade natural caminhe ao longo de todo o comprimento. Assim, é comum que as pontas fiquem ressecadas e os fios com frizz. Como o low poo reduz o uso do shampoo e aceita somente produtos sem sulfato, os óleos naturais podem fazer o seu trabalho e manter o cabelo mais saudável e bonito.\nA técnica ajuda também quem lava os cabelos com frequência, sofre com sensibilidade no couro cabeludo ou passou por transplante capilar.\nPor outro lado, pessoas com cabelos oleosos precisam ter mais atenção, já que o low poo pode piorar a condição e causar o surgimento de caspa. O método não costuma ser indicado para quem lida com problemas como dermatite seborreica. Em todo caso, o ideal é sempre consultar um dermatologista antes de iniciar essa ou qualquer outra técnica.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("O que é liberado no low poo?",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "O objetivo desse método é fugir de componentes como lauril sulfato de sódio, sulfossuccinato de sódio e derivados do petróleo. Esses últimos formam uma película que envolve os fios e que, ao longo do tempo, impede que o cabelo receba os nutrientes de que precisa.\nEntão, fique de olho no rótulo de shampoos e condicionadores e atenção para itens como óleo mineral, parafina líquida e vaselina, por exemplo.\nNo mercado, há várias opções de produtos desenvolvidos especificamente para o low poo, mas você pode também adotar uma versão caseira da técnica. Para isso, use shampoo e condicionador sem ingredientes agressivos na fórmula e dilua em água (use a mesma quantidade de produto e água para essa mistura).",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 10),
                        Text(
                          "Texto por Jornal DCI. [SI] [07/2020]. Disponível em: <https://www.dci.com.br/industria/beleza/guia-low-poo/3778/> Acesso em: 08 de junho de 2021.",
                          style: AppTextStyles.small,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Sobre No Poo",
                            style: AppTextStyles.contentTitleBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "O termo significa algo como sem shampoo e foi desenvolvido com o intuito de limpar os fios de maneira mais natural, sem utilizar composições químicas que os danificam e agridem.\nAs duas técnicas (low poo e no poo) proíbem totalmente o uso de qualquer tipo de silicone, emulsionante e derivados de petróleo (óleo mineral, parafina e vaselina, por exemplo). A diferença básica entre elas mora na quantidade de substâncias que são liberadas nos produtos.\nO low poo é um pouco mais flexível e permite alguns compostos, como o sulfato, responsável pela limpeza e por produzir espuma, desde que em baixa concentração. Ele é indicado, principalmente, para quem tem os cabelos muito oleosos e precisa dos shampoos tradicionais.\nPor outro lado, o no poo é muito mais restrito e, por isso, você passa longe dos shampoos com qualquer quantidade de sulfato. Esses agentes promovem a limpeza do couro cabeludo, mas acabam removendo a oleosidade natural dos fios – necessária para mantê-los hidratados.\nO objetivo desses métodos de lavagem é deixar os cabelos livres do frizz, mais leves e iluminados. A técnica no poo também é ótima para cabelos cacheados e crespos, porque oferece mais definição sem pesar. Entretanto, pode ser utilizada por todos os fios, inclusive os coloridos e com mechas.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 15),
                        Text("Como funciona a técnica?",
                            style: AppTextStyles.labelBold,
                            textAlign: TextAlign.left),
                        SizedBox(height: 10),
                        Text(
                            "Na rotina no poo você elimina o uso de shampoos. Mas como lavar os cabelos então? A resposta são os condicionadores conhecidos como co-wash (conditioner wash) ou cremes de limpeza. O essencial é que eles não contêm petrolatos nem silicones insolúveis. O mesmo vale para outros itens, como máscaras de hidratação e cremes de pentear sem enxágue.\nSe você quer entrar para o time dos que já aderiram à técnica, lave uma última vez os cabelos com shampoo com sulfato. Isso vai remover resíduos de silicones insolúveis e derivados de petróleo. Logo depois, use um produto no poo para condicionar os fios.\nCom a técnica, seus cabelos vão ficar mais saudáveis e macios. No entanto, apesar dos benefícios do no poo, é bom ficar de olho caso a mudança nas lavagens apresente o aparecimento de caspa no couro cabeludo ou alterações no aspecto dos fios.\nAlém disso, se não conseguir encontrar as informações sobre os componentes dos produtos nas embalagens, você pode fazer um teste simples: se fizer espuma, não entra na rotina no poo.",
                            style: AppTextStyles.body,
                            textAlign: TextAlign.justify),
                        SizedBox(height: 10),
                        Text(
                          "Texto por Jornal DCI. [SI] [08/2020]. Disponível em: <https://www.dci.com.br/industria/beleza/no-poo-lavar-cabelos/3906/> Acesso em: 08 de junho de 2021.",
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
    );
  }
}
