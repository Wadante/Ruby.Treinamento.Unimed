require_relative '..//page/home_page.rb'

home = Home.new
Dado('que verifico o carrocel') do
  home.validar_carrossel
end
