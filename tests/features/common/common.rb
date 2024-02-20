require_relative '..//page/common_page.rb'

common = Common.new

Dado('que estou na página inicial') do
  common.acessar_home
end

Dado('que estou na página inicial e aceito o cookies {string} com {string}') do  |field, value|
  visit '/'
  fill_in field, with: value
end


Quando('preencho o campo {string} com {string}') do |field, value|
  fill_in field, with: value
end

E('clico no botão {string}') do |button|
  click_button button
end

E('clico no botão') do |elemento|
  click_button elemento
end

Então('eu devo ver {string}') do |content|
  expect(page).to have_content(content)
end

Então('eu verifico se estou na página correta') do |current_path|
  expect(page).to have_current_path(current_path)
end

Então('eu verifico se estou na página correta {string}') do |current_path|
  expect(page).to have_current_path(current_path)
end
