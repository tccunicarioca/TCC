Integração do Android com a nuvem, utilizando recursos do Microsoft AZURE

<CENÁRIOS>

##Cenário 2 - Cadastro de prestador de serviço

	O usuário deseja ingressar no aplicativo como  prestador de serviço, não tendo um cadastro como cliente. Ele dispõe de duas das competências que podem ser buscados pelo aplicativo. O Usuário deve efetuar um cadastro como novo colaborador pessoa física ou juridica, utilizando:
	- nome real 
	- cpf/cnpj válidos 
	- imagem de perfil (colaborador ou logo da empresa) 
	- endereço residencial ou comercial (que poderá ser mostrado ou não a clientes, conforme modo de trabalho do colaborador)
	- valor base de orçamento
	- Horário de atendimento
	- Áreas de atuação
	...
	
#_ RN01 - Todo colaborador necessita de um cadastro contendo dados válidos.

##Cenário 3

  Um usuário comum busca um determinado serviço em sua proximidade. Ele não dispõe de listas de serviços para consulta no momento. Não tem conhecimento sobre profissionais de confiança na localidade onde esta. Também não tem em sua agenda, contatos de pessoas de confiança, para realizar uma consulta a respeito de um profissional, seja porque esta sem acesso a essas pessoas no momento, ou porque nenhuma utilizou o serviço de que ele necessita recentemente. 


###Resumo do cenário 3

  O cliente precisa realizar um trabalho específico; Um profissional de confiança (com possíveis recomendações); Proximidade de sua localização atual; Possibilidade de avaliar para outros usuários; Possibilidade de consultar a área onde o serviço é disponibilizado caso queira se locomover até lá (exemplo: oficinas).

##Cenário 4

 	Um profissional deseja ampliar seu público alvo. Possui um serviço de qualidade, mas não tem muitos meios de se promover no momento. Ele tem possibilidade de se deslocar dentro de um espaço de média amplitude, porém seus possíveis clientes podem estar em qualquer lugar dentro desse espaço. Podem haver clientes próximos com a necessidade de seus serviços e ele precisa saber onde. 
	
###Resumo do cenário 4

  O profissional precisa encontrar um público alvo para seus serviços; Precisa saber sua localização, caso precise se locomover até lá; Precisa de feedbacks positivos para novas contratações.


<VISÃO>
	
	  O Sistema deve permitir ao usuário acessar um grupo de profissionais (1), dentro de uma área especificada pelo aplicativo (2). 
    Estes profissionais devem ser previamente cadastrados no sistema, com seus dados e localidade (3). 
    Profissionais  (e clientes) serão armazenados em nuvem através do Microsoft Azzure(4).

1

	A utilização do sistema será através de interface gráfica, por um aplicativo mobile, desenvolvido na plataforma Android. Haverá disposição de telas para busca do tipo de profissional ou serviço solicitado, telas para consulta de proximidades em mapa e possibilidade de armazenar serviços favorito, que poderá ser consultado de outros aparelhos compatíveis através de login e senha (Opcional) (?)
	
1.1  

  O aplicativo vai permitir login e senha para o usuário (?) a fim de permitir consultar avaliações serviços ou lista de favoritos (?). 


2

  A verificação de área vai levar em consideração a localização do cliente. Logo a busca será efetuada em um quadrante de proximidade pré-determinado de distância, a partir do ponto onde o usuário estiver. 
  

2.2 

  Verificação efetuada através das tecnologias de GPS e geração de mapas possibilitadas pelos recursos já disponíveis no Android, que deverão ser integrados ao aplicativo.. 


3

  O cadastro dos profissionais pode ser realizado pelo próprio aplicativo (ou por acesso externo através de terceiros (?)). A consulta sera disponibilizada após verificação nas proximidades através de um mapa. Um login e senha possibilita consultar oportunidades de trabalho de sua especialidade dentro da área ou amplitude previamente cadastrada.

4 


<CLASSES (Possíveis)>
Cliente
  •	Atributos: Nome, Login, Senha e Localização
  •	Métodos: 
Profissional
  •	Atributos: Nome, Login, Senha, Localização e Avaliações
  •	Métodos: 
FeedBack
  •	Atributos: Data/horário, o cliente, o profissional e avaliação
  •	Métodos: 
