require 'capybara/dsl'
require 'faker'
require_relative './common_page.rb'

class FaleComAUnimed
  include Capybara::DSL

  def initialize
    @common = Common.new
  end

  $cliente_sim              = "//button[@name='cliente']"
  $cliente_nao              = "//button[@name='naoCliente']"
  $nome                     = "//input[@name='nome']"
  $email                    = "//input[@name='email']"
  $telefone                 = '//*[@id="telefone"]'
  $clicar_estado            = '//*[@id="js-portlet-_br_coop_unimed_falecomaunimad_FaleComUnimedPortlet_INSTANCE_zVI1EtrH1Ctm_"]/div/div[2]/form/div[3]/div[1]/div/div'
  $clicar_cidade            = '//*[@id="js-portlet-_br_coop_unimed_falecomaunimad_FaleComUnimedPortlet_INSTANCE_zVI1EtrH1Ctm_"]/div/div[2]/form/div[3]/div[2]/div/div'
  $clicar_manifestacao      = '//*[@id="js-portlet-_br_coop_unimed_falecomaunimad_FaleComUnimedPortlet_INSTANCE_zVI1EtrH1Ctm_"]/div/div[2]/form/div[5]/div[1]/div'
  $clicar_assunto           = '//*[@id="js-portlet-_br_coop_unimed_falecomaunimad_FaleComUnimedPortlet_INSTANCE_zVI1EtrH1Ctm_"]/div/div[2]/form/div[6]/div[2]/div'
  $mensagem                 = '#mensagem'
  $texto_voce_ja            = '//*[@id="js-portlet-_br_coop_unimed_falecomaunimad_FaleComUnimedPortlet_INSTANCE_zVI1EtrH1Ctm_"]/div/div[1]/div/div[2]/p'
  $texto_numero_de_carterinha_invalido  = '//*[@id="fale-com-unimed"]/div[1]/div[2]/div'

  def cliente(opcao)
    case opcao.downcase
    when 'sim'
      return $cliente_sim
    when 'não'
      return $cliente_nao
    else
      raise ArgumentError, 'Opção inválida. Escolha entre "Sim", ou "Não".'
    end
  end

  def  opcao_nao_informe_os_dados
    find(:xpath, $nome).click.set(@common.faker("Nome"))
    find(:xpath, $email).click.set(@common.faker("Email"))
    selecionar_estado("Acre")
    selecionar_cidade("Acrelândia")
    selecionar_manifestacao
    selecionar_assunto
    find(:xpath, $telefone).click.set(@common.faker("Telefone"))
    find($mensagem).click.set(@common.faker("Nome"))
  end

  def selecionar_estado(estado)
    clicar_seletor(:estado)
    find(:xpath, "//div[@id='react-select-2--list']/div/div/div/div[#{estado_index(estado)}]").click
  end

  def selecionar_cidade(cidade)
    clicar_seletor(:cidade)
    find(:xpath, "//div[@id='react-select-3--list']/div/div/div/div[1]").click
  end

  def selecionar_manifestacao
    clicar_seletor(:manifestacao)
    find(:xpath, "//div[@id='react-select-4--list']/div/div/div/div[1]").click
  end

  def selecionar_assunto
    clicar_seletor(:assunto)
    find(:xpath, "//div[@id='react-select-5--list']/div/div/div/div[1]").click
  end

  def texto_voce
    find(:xpath, $texto_voce_ja).click
  end

  def numero_de_carteirinha(numero)
    if page.has_css?('.tooltip-inner > span', text: 'N° não encontrado')
      File.open('carteirinha_invalida.txt', 'a') { |file| file.puts(numero) }
      return true
    else
      File.open('carteirinha_valida.txt', 'a') { |file| file.puts(numero) }
    end
    return false
  end

  def numero_de_carteirinha_invalido(numero)
    if page.has_css?('.tooltip-inner > span', text: 'Número de carteirinha inválido')
      #File.open('carteirinha_invalida.txt', 'a') { |file| file.puts(numero) }
      return true
    else
      File.open('carteirinha_valida.txt', 'a') { |file| file.puts(numero) }
    end
    return false
  end

  def clicar_seletor(seletor)
    case seletor
      when :estado
        element = find('#estado')
      when :cidade
        element = find('#cidade')
      when :manifestacao
        element = find('#manifestacao')
      when :assunto
        element = find('#assunto')
      else
        raise ArgumentError, 'Seletor inválido'
      end
    element.find(:xpath, './ancestor::div[contains(@class, "Select")]//div[contains(@class, "Select-multi-value-wrapper")]').click
  end

  private

  def estado_index(estado)
    estados = ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"]
    index = estados.index(estado).to_i
    return index + 1
  end

  def numero_cartao
    return $numero_cartao
  end


end
