luaunit = require("luaunit")
jogoTeste = require("jogo")

function testPosicaoValida()

	local jogo = jogoTeste:novo()
	luaunit.assertEquals(jogo:posicaoValida(2,3)[1], true)

end

function testPosicaoInvalida()

	local jogo = jogoTeste:novo()
	luaunit.assertEquals(jogo:posicaoValida(2,5)[1], false)

end

function testJogadaValida()

	local jogo = jogoTeste:novo()
	local jogadorDaVez = jogo.jogador1
	jogo.jogador1.jogada = "X"
	luaunit.assertEquals(jogo:novaJogada(3,2,jogadorDaVez)[1], true)

end

function testJogadaInvalidaJaJogada()

	local jogo = jogoTeste:novo()
	local jogadorDaVez = jogo.jogador1
	jogo.jogador1.jogada = "O"
	jogo:novaJogada(3,3,jogadorDaVez)
	luaunit.assertEquals(jogo:novaJogada(3,3,jogadorDaVez)[1], false)

end

function testJogadaInvalidaValoreNaoNumerico()

	local jogo = jogoTeste:novo()
	local jogadorDaVez = jogo.jogador1
	jogo.jogador1.jogada = "O"
	luaunit.assertEquals(jogo:novaJogada("a",3,jogadorDaVez)[1], false)

end

function testJogadaInvalida()

	local jogo = jogoTeste:novo()
	local jogadorDaVez = jogo.jogador1
	jogo.jogador1.jogada = "O"
	luaunit.assertEquals(jogo:novaJogada(4,3,jogadorDaVez)[1], false)

end

function testEmpate()

	jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "X"
	jogo.jogador2.jogada = "O"
	jogo:novaJogada(1,1,jogo.jogador1) 	jogo:novaJogada(1,2,jogo.jogador2) jogo:novaJogada(1,3,jogo.jogador1)
	jogo:novaJogada(2,1,jogo.jogador1) 	jogo:novaJogada(2,2,jogo.jogador1) jogo:novaJogada(2,3,jogo.jogador2)
	jogo:novaJogada(3,1,jogo.jogador2) 	jogo:novaJogada(3,2,jogo.jogador1)	jogo:novaJogada(3,3,jogo.jogador2)
	luaunit.assertEquals(jogo:termino()[2] == 2, true)

	--[[

		X |	O | X
		X |	X | O
		O | X | O

	--]]


end

function testVencedorLinhaUm()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "X"
	jogo:novaJogada(1,1,jogo.jogador1)	jogo:novaJogada(1,2,jogo.jogador1)	jogo:novaJogada(1,3,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testVencedorLinhaDois()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "O"
	jogo:novaJogada(2,1,jogo.jogador1)	jogo:novaJogada(2,2,jogo.jogador1)	jogo:novaJogada(2,3,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testVencedorLinhaTres()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "X"
	jogo.jogador2.jogada = "O"
	jogo:novaJogada(3,1,jogo.jogador1)	jogo:novaJogada(3,2,jogo.jogador1)	jogo:novaJogada(3,3,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testVencedorColunaUm()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "X"
	jogo:novaJogada(1,1,jogo.jogador1)	jogo:novaJogada(2,1,jogo.jogador1)	jogo:novaJogada(3,1,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end


function testVencedorColunaDois()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "O"
	jogo:novaJogada(1,2,jogo.jogador1)	jogo:novaJogada(2,2,jogo.jogador1)	jogo:novaJogada(3,2,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testVencedorColunaTres()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "X"
	jogo:novaJogada(1,3,jogo.jogador1)	jogo:novaJogada(2,3,jogo.jogador1)	jogo:novaJogada(3,3,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testVencedorDiagonalPrincipal()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "O"
	jogo:novaJogada(1,1,jogo.jogador1)	jogo:novaJogada(2,2,jogo.jogador1)	jogo:novaJogada(3,3,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testVencedorColunaTres()

	local jogo = jogoTeste:novo()
	jogo.jogador1.jogada = "X"
	jogo:novaJogada(1,3,jogo.jogador1)	jogo:novaJogada(2,2,jogo.jogador1)	jogo:novaJogada(3,1,jogo.jogador1)
	luaunit.assertEquals(jogo:termino()[1], true)

end

function testValoresValidos()

	local jogo = jogoTeste:novo()
	luaunit.assertTrue(jogo:valoresValidos(2,1))

end

function testValoresInalidosNumericos()

	local jogo = jogoTeste:novo()
	luaunit.assertEquals(jogo:valoresValidos(2,9), false)

end

function testValoresInalidosLinhaNaoNumerica()

	local jogo = jogoTeste:novo()
	luaunit.assertEquals(jogo:valoresValidos("A",9), false)

end

function testValoresInalidosColunaNaoNumerica()

	local jogo = jogoTeste:novo()
	luaunit.assertEquals(jogo:valoresValidos(1,"s"), false)

end

function testValoresInalidosNaoNumericos()

	local jogo = jogoTeste:novo()
	luaunit.assertEquals(jogo:valoresValidos("A","v"), false)

end

os.exit( luaunit.LuaUnit.run() )

