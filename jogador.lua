jogador = {}


function jogador:novo()


	novoJogador = {nome = "", jogada = ""}

	novoJogador = setmetatable(novoJogador, {__index = jogador})

    return novoJogador

end

return jogador:novo()



