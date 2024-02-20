require 'capybara/dsl'
require 'faker'
require 'site_prism'
require 'rspec'

class Common < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @home = '/'
  end

  def acessar_home
    visit @home
  end

  def acessar_link(link)
    visit link
  end

  def clicar_no_botao(botao)
    if botao.start_with?('//')
      find(:xpath, botao).click
    else
      find(botao).click
    end
  end

  def faker(opcao)
    case opcao.downcase
    when 'nome'
      return Faker::Name.name
    when 'email'
      return Faker::Internet.email
    when 'telefone'
      return Faker::PhoneNumber.phone_number
    else
      raise ArgumentError, 'Opção inválida. Escolha entre "Nome","Email", ou "Telefone".'
    end
  end

  def selecionar_opcao(elemento, opcao)
    find(elemento).select(opcao)
  end

  def verificar_se_elemento_esta_visivel(elemento)
    expect(page).to have_selector(:xpath, elemento, visible: true)
  end
  
end
