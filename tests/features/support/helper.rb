require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'

module Helper
  include Capybara::DSL
  include Capybara::RSpecMatchers

  def tirar_foto(nome_arquivo, resultado)
    caminho_arquivo = "results/screenshots/test_#{resultado}"
    foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
    page.save_screenshot(foto)
    puts "Captura de tela salva em: #{foto}" 
  end
end
