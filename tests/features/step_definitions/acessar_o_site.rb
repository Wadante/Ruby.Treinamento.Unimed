require_relative '..//page/home_page.rb'

home = Home.new
pagina_estado= PaginaEstado.new

Quando('clico no botão aceitar cookies') do
  sleep 2
  find(:xpath, home.aceitar_todos_os_cookies).click
end

E('clico no botão Login') do
  find(:xpath, home.botao_login).click
end

Quando('clico no botão Consulte agora') do
  find(:xpath, home.botao_consulte_agora).click
end

Quando('eu seleciono o estado {string}') do |estado|
  pagina_estado.selecionar_estado(estado)
end

Quando('eu seleciono o cidade {string}') do |estado|
  pagina_estado.selecionar_cidade(estado)
end

Quando('eu seleciono a Unimed {string}') do |unimed|
  pagina_estado.selecionar_unimed(unimed)
end

Então('verifico se o botão acessar está visivel') do
  expect(page).to have_selector('#btnAcessar', visible: true)
  botao_acessar = find('#btnAcessar')
  expect(botao_acessar[:disabled]).to eq('false')
end
