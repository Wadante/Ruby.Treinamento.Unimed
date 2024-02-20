After do |scenario|
  scenario_name = scenario.name.dup # Crie uma cópia do nome do cenário
  scenario_name = scenario_name.gsub(/[áàâã]/, 'a').gsub(/[éèê]/, 'e').gsub(/[íìî]/, 'i').gsub(/[óòôõ]/, 'o').gsub(/[úùû]/, 'u').gsub(/[ç]/, 'c').gsub(/\?/, '_').gsub(/\s+/, '_').tr('/', '_')

  def embed(x, _y = nil, _z = nil)
    puts "Screenshot at #{x}"
  end

  if scenario.failed?
    caminho_foto = tirar_foto(scenario_name.downcase!, 'falhou')
    begin
      embed(caminho_foto, 'image/png', 'Screenshot')
    rescue => exception
      puts "Ocorreu uma exceção: #{exception.message}"
    end
  end

end
