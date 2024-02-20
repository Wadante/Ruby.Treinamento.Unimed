require_relative './variables/home_variable.rb'
class Home
  include HomeVariable
  def cookies(opcao); case opcao.downcase; when TXT_ACEITAR_TODOS then ACEITAR_TODOS; when TXT_NEGAR then NEGAR; when TXT_NAO_AJUSTAR then NAO_AJUSTAR; else raise ArgumentError, MENSAGEM_ERRO; end; end
  def botao_login; BOTAO_LOGIN; end
  def botao_consulte_agora; BOTAO_CONSULTE_AGORA; end
end
