#language: pt

Funcionalidade: Realizar o teste do cookies da tela home

  Contexto: Acessar o site e aceitar todos os cokies
    Dado que estou na página inicial
   
  @CT01-Aceitar_cookies_da_tela_de_Login
  Esquema do Cenário: Aceitar cookies da tela de Login
    Quando clico no botão <cookies> 

  Exemplos:
  |cookies         |
  |"Aceitar todos" |
  |"Negar"         |
  |"Não, ajustar"  |

