pierde = { 					#es un hash
		:piedra => :tijeras,		#gana->pierde
      		:papel => :piedra, 
		:tijeras => :papel}
tiro = pierde.keys

if ARGV.size == 0 
	puts "Elige uno de #{tiro.join(', ')}: "
	player_throw = gets.chomp.to_sym		#gets:lee ,  chomp: quita /r/n ,  to_sym: pasa a símbolo :... 
else 
	player_throw = (ARGV.shift || '').to_sym	#shift: coge el primer elemento de argv y lo elimina de argv
	#player_throw = (ARGV.shift).to_sym
	puts "player_throw: #{player_throw}."
end

raise ScriptError, 			#Lanza una excepción de tipo ScriptError
	#join une en una cadena los elementos del array
	"Debe ejecutar: ''#{$0}'' seguido de uno de los siguientes: '#{tiro.join(', ')}'"				     unless tiro.include? player_throw	# true si tiro incluye player_throw

computer_throw = tiro.sample				#devuelve un valor aleatorio(random) de tiro
puts "computer_throw: #{computer_throw}\n"

if player_throw == computer_throw
	answer = "Hay un empate"
elsif player_throw == pierde[computer_throw]
	answer = "Pierdes. #{computer_throw} derrota a #{player_throw}"
else
	answer = "Bien hecho. #{player_throw} gana a #{computer_throw}"
end
puts answer

