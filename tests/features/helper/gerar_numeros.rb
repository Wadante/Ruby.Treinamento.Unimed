class GerarNumeros

  def gerar_numero_nao_encontrado
    numero = rand(10**17)  # Gera um número aleatório de 17 dígitos
    return sprintf("%017d", numero)  # Formata o número para ter 17 dígitos preenchendo com zeros à esquerda, se necessário
  end

  def gerar_numero_invalido
    numero = rand(10**16)  # Gera um número aleatório de 16 dígitos
    return sprintf("%016d", numero)  # Formata o número para ter 16 dígitos preenchendo com zeros à esquerda, se necessário
  end

end
