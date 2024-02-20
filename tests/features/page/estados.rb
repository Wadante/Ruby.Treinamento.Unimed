require 'site_prism'

class PaginaEstado < SitePrism::Page
  $estado = '#estadoSelecionado'
  $cidade = '#cidadeSelecionada'
  $unimed = '#suaUnimed'

  def selecionar_estado(estado)
    find($estado).select(estado)
  end

  def selecionar_cidade(cidade)
    find($cidade, wait: 5).select(cidade)
  end

  def selecionar_unimed(unimed)
    find($unimed, wait: 5).select(unimed)
  end
end
