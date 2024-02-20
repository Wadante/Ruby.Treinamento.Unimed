#language: pt

Funcionalidade: Exemplo de teste com Capybara e Selenium

  Contexto: Acessar o site e aceitar todos os cokies
    Dado que estou na página inicial
    Quando clico no botão aceitar cookies

  @CT01-Acessar_o_site_e_selecionar_o_estado
  Esquema do Cenário: Acessar o site e selecionar o estado
    E clico no botão Login
    Então eu verifico se estou na página correta "/login-site"
    Quando eu seleciono o estado "<estado>"
    Quando eu seleciono o cidade "<cidade>"
    Quando eu seleciono a Unimed "<unimed>"
    Então verifico se o botão acessar está visivel

    Exemplos: 
    |estado       |cidade   |unimed     |
    |Mato Grosso  |Acorizal |UNIMED CUIABÁ|
    |Maranhão     |Balsas   |UNIMED MARANHÃO DO SUL|

  @CT02-Acessar_o_site_e_clicar_no_botão_Consulte_agora @ignore @regressivo
  Cenário: Acessar o site e clicar no botão Consulte agora
    E clico no botão Consulte agora
    Então eu verifico se estou na página correta "/login-site"
