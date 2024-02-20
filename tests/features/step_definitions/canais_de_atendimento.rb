require_relative '..//page/common_page.rb'
require_relative '..//helper/gerar_numeros.rb'
require_relative '..//page/canais_atendimento_page.rb'
require_relative '..//page/fale_com_a_unimed_page.rb'

common          = Common.new
canais_atend    = CanaisAtendimento.new
fale_com_unimed = FaleComAUnimed.new
gerar_numeros   = GerarNumeros.new


Dado('que acesso a tela Canais de atendimento') do
  common.acessar_link(canais_atend.canais_de_atendimento)
end

Quando('Clico em Quero Falar com a Unimed') do
  common.clicar_no_botao(canais_atend.quero_falar_com_a_unimed)
end

Quando('respondo Você já é cliente Unimed? {string}') do |cliente|
  common.clicar_no_botao(fale_com_unimed.cliente(cliente))
end

Então('devo informar os meus dados') do
  fale_com_unimed.opcao_nao_informe_os_dados
end

Então('Enviar a mensagem') do
  common.verificar_se_elemento_esta_visivel(canais_atend.botao_enviar_mensagem)
end


Então('devo informar o {string} do meu cartão') do |numero|
  canais_atend.numero_do_cartao(numero)
end

Então('devo informar o aleatório do meu cartão não encontrado') do
    loop do
    $numero = gerar_numeros.gerar_numero_nao_encontrado.to_s
    canais_atend.numero_do_cartao($numero)
    fale_com_unimed.texto_voce
    #expect(fale_com_unimed.numero_de_carteirinha($numero)).to eq(true)
      break if fale_com_unimed.numero_de_carteirinha($numero)
    end
end

Então('devo informar o aleatório do meu cartão inválido') do
  $numero = gerar_numeros.gerar_numero_nao_encontrado.to_s
  canais_atend.numero_do_cartao($numero)
  fale_com_unimed.texto_voce
  expect(fale_com_unimed.numero_de_carteirinha($numero)).to eq(true)
end

Então('devo preencheer os meus dados') do
  canais_atend.opcao_sim_informe_os_dados
end
