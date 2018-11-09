class InfoNutricional
	attr_reader :nombre, :porcion, :grasa, :grasa_saturada, :grasa_monoinsaturada, :grasa_poliinsaturada, :carbohidratos, :azucar, :polialcoholes, :almidon, :fibra, :proteina, :sal
	
	def initialize(nombre, porcion, grasa, grasa_saturada, grasa_monoinsaturada, grasa_poliinsaturada, carbohidratos, azucar, polialcoholes, almidon, fibra, proteina, sal)
		@nombre, @porcion, @grasa, @grasa_saturada, @grasa_monoinsaturada, @grasa_poliinsaturada, @carbohidratos, @azucar, @polialcoholes, @almidon, @fibra, @proteina, @sal = nombre, porcion, grasa, grasa_saturada, grasa_monoinsaturada, grasa_poliinsaturada, carbohidratos, azucar, polialcoholes, almidon, fibra, proteina, sal
	end

	def valor_energetico
		(@grasa*9+@carbohidratos*4+@proteina*4+@fibra*2+@sal*6).round
	end

	def ir_kcal
		valor_energetico.to_f*@porcion/2000
	end

	def ir_grasa
		@grasa.to_f*@porcion/70
	end

	def ir_grasa_saturada
		@grasa_saturada.to_f*@porcion/20
	end

	def to_s
		filas = [["Valor energético","#{(valor_energetico*4.1868).round}kJ/ #{valor_energetico}kcal", "#{(valor_energetico*4.1686*@porcion/100).round}kJ/ #{(valor_energetico*@porcion/100).round}kcal"], 
	   ["Grasas totales\n -Saturadas\n -Monoinsaturada\n -Poliinsaturada", "#{@grasa}g\n#{@grasa_saturada}g\n#{@grasa_monoinsaturada}g\n#{@grasa_poliinsaturada}g", "#{@grasa*@porcion/100}g\n#{@grasa_saturada*@porcion/100}g\n#{@grasa_monoinsaturada*@porcion/100}g\n#{@grasa_poliinsaturada*@porcion/100}g"], 
	   ["Hidratos de carbono\n -Azúcares\n -Polialcoholes\n -Almidón","#{@carbohidratos}g\n#{@azucar}g\n#{@polialcoholes}g\n#{@almidon}g","#{@carbohidratos*@porcion/100}g\n#{@azucar*@porcion/100}g\n#{@polialcoholes*@porcion/100}g\n#{@almidon*@porcion/100}g"], 
	   ["Fibra","#{@fibra}g","#{@fibra*@porcion/100}g"], 
	   ["Proteina","#{@proteina}g","#{@proteina*@porcion/100}g"], 
	   ["Sal","#{@sal}g","#{@sal*@porcion/100}g"]]
tabla = Terminal::Table.new :title => "Galletas integrales", :headings => ['', 'Cantidad por 100g', "Cantidad por porción (20g)"], :rows => filas
	end
end
