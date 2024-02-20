require 'capybara/dsl'
require 'faker'
require_relative './common_page.rb'

class CanaisAtendimento
  include Capybara::DSL

  def initialize
    @common = Common.new
    @fale_com_a_unimed = FaleComAUnimed.new
  end

  $canais_de_atendimento    = '/site/canais-atendimento'
  $quero_falar_com_a_unimed = "//img[@alt='Quero falar com a Unimed']"
  $botao_enviar_mensagem    = '//*[@id="js-portlet-_br_coop_unimed_falecomaunimad_FaleComUnimedPortlet_INSTANCE_zVI1EtrH1Ctm_"]/div/div[2]/form/a'
  $numero_cartao            = '//*[@id="cartao"]'
  $email                    = '//*[@id="email"]'
  $telefone                 = '//*[@id="telefone"]'
  $clicar_manifestacao      = ''
  $clicar_assunto           = "//div[@class='Select-control']//div[contains(text(), 'Assunto')]"
  $mensagem                 = '//*[@id="mensagem"]'

  def canais_de_atendimento
    return $canais_de_atendimento
  end

  def quero_falar_com_a_unimed
    return $quero_falar_com_a_unimed
  end

  def botao_enviar_mensagem
    return $botao_enviar_mensagem
  end

  def numero_do_cartao(numero)
    find(:xpath, $numero_cartao).click.set(numero)
  end

  def  opcao_sim_informe_os_dados
    find(:xpath, $email).click.set(@common.faker("Email"))
    find(:xpath, $telefone).click.set(@common.faker("Telefone"))
    selecionar_manifestacao
    selecionar_assunto
    find($mensagem).click.set(@common.faker("Nome"))
  end

  def selecionar_manifestacao
    @fale_com_a_unimed.clicar_seletor(:manifestacao)
   find(:xpath, "//div[@id='react-select-2--list']/div/div/div/div[3]").click
 end

 def selecionar_assunto
  @fale_com_a_unimed.clicar_seletor(:assunto)
   find(:xpath, "//div[@id='react-select-3--list']/div/div/div/div[1]").click
 end

end
