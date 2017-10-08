jogador = {}


function jogador:inicializar()


	novoJogador = {nome = "", jogada = "", pontos = 0}

	novoJogador = setmetatable(novoJogador, {__index = jogador})

    return novoJogador

end

return jogador


