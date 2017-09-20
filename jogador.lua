jogador = {}


function jogador:inicializar()


	novoJogador = {nome = "", jogada = ""}

	novoJogador = setmetatable(novoJogador, {__index = jogador})

    return novoJogador

end

return jogador


