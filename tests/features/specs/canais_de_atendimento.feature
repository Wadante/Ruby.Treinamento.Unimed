#language: pt

@CT-Canais_de_atendimento
Funcionalidade: Realizar o teste dos Canais de atendimento

  Contexto: Acessar o site e clicar em cookies
    Dado que estou na página inicial
    Quando clico no botão "Negar"
   
    @CT01-Canais_de_atendimento_quero_falar_com_a_Unimed_cliente_nao
    Cenário: Acessar os Canais de atendimento e quero falar com a unimed Você já é cliente Unimed? Não
        Dado que acesso a tela Canais de atendimento
        Quando Clico em Quero Falar com a Unimed
        E respondo Você já é cliente Unimed? "Não"
        Então devo informar os meus dados 
        E Enviar a mensagem

    @CT02-Canais_de_atendimento_quero_falar_com_a_Unimed_cliente_sim
    Esquema do Cenário: Acessar os Canais de atendimento e quero falar com a unimed Você já é cliente Unimed? Sim
        Dado que acesso a tela Canais de atendimento
        Quando Clico em Quero Falar com a Unimed
        E respondo Você já é cliente Unimed? "Sim"
        Então devo informar o <numero> do meu cartão
        E devo preencheer os meus dados
        E Enviar a mensagem

      Exemplos: 
        |numero                 |
        |'09790020063121544'    |

    #@CT03-Canais_de_atendimento_quero_contratar_um_plano_pessoa_fisica
    #Cenário: Acessar os Canais de atendimento e Quero contratar um plano
    #    Dado que acesso a tela Canais de atendimento
    #    Quando Clico em Quero contratar um plano
    #    E seleciono a opção "Pessoa Física"
    #    Então devo informar os meus dados pessoa física
    #    E Clicar no botão Solicitar Plano Ideal
#
    #@CT04-Canais_de_atendimento_quero_contratar_um_plano_pessoa_jurídica
    #Cenário: Acessar os Canais de atendimento e Quero contratar um plano
    #    Dado que acesso a tela Canais de atendimento
    #    Quando Clico em Quero contratar um plano
    #    E seleciono a opção "Pessoa Jurídica"
    #    Então devo informar os meus dados pessoa jurídica
    #    E Clicar no botão Solicitar Plano Ideal
#

    @CT05-Canais_de_atendimento_quero_falar_com_a_Unimed_cliente_sim_validar_n_cartao_n_encntrado
    Esquema do Cenário: Acessar os Canais de atendimento e quero falar com a unimed Você já é cliente Unimed? Sim e informar número de um cartão não encontrado
        Dado que acesso a tela Canais de atendimento
        Quando Clico em Quero Falar com a Unimed
        E respondo Você já é cliente Unimed? "Sim"
        Então devo informar o aleatório do meu cartão não encontrado
       
    @CT06-Canais_de_atendimento_quero_falar_com_a_Unimed_cliente_sim_validar_n_cartao_inválido
    Esquema do Cenário: Acessar os Canais de atendimento e quero falar com a unimed Você já é cliente Unimed? Sim e informar número de um cartão inválido
        Dado que acesso a tela Canais de atendimento
        Quando Clico em Quero Falar com a Unimed
        E respondo Você já é cliente Unimed? "Sim"
        Então devo informar o aleatório do meu cartão inválido
       
