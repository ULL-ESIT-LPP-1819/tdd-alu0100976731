class InfoNutricional
	attr_reader :nombre, :porcion, :grasa, :grasa_saturada, :grasa_monoinsaturada, :grasa_poliinsaturada, :carbohidratos, :azucar, :polialcoholes, :almidon, :fibra, :proteina, :sal
	
	def initialize(nombre, porcion, grasa, grasa_saturada, carbohidratos, azucar, proteina, sal, *otros)
		@nombre = nombre
		@porcion = porcion
		@grasa = grasa
		@grasa_saturada = grasa_saturada
		@carbohidratos = carbohidratos
		@azucar = azucar
		@proteina = proteina
		@sal = sal
		@grasa_monoinsaturada = otros[0]
		@grasa_poliinsaturada = otros[1]
		@polialcoholes = otros[2]
		@almidon = otros[3]
		@fibra = otros[4]
	end

	def valor_energetico
		(@grasa*9+@carbohidratos*4+@proteina*4+@fibra*2+@sal*6).round
	end

	def ir_kcal
		(valor_energetico.to_f*@porcion/2000).round(2)
	end

	def ir_grasa
		(@grasa.to_f*@porcion/70).round(2)
	end

	def ir_grasa_saturada
		(@grasa_saturada.to_f*@porcion/20).round(2)
	end

	def ir_carbohidratos
		(@carbohidratos.to_f*@porcion/260).round(2)
	end
	
	def ir_azucar
		(@azucar.to_f*@porcion/90).round(2)
	end

	def ir_proteina
		(@proteina.to_f*@porcion/50).round(2)
	end

	def ir_sal
		(@sal.to_f*@porcion/6).round(2)
	end

	def to_s
		filas = [["Valor energético","#{(valor_energetico*4.1868).round}kJ/ #{valor_energetico}kcal", "#{(valor_energetico*4.1686*@porcion/100).round}kJ/ #{(valor_energetico*@porcion/100).round}kcal","#{self.ir_kcal}%"], 
	   ["Grasas totales\n -Saturadas\n -Monoinsaturada\n -Poliinsaturada", "#{@grasa}g\n#{@grasa_saturada}g\n#{@grasa_monoinsaturada}g\n#{@grasa_poliinsaturada}g", "#{@grasa*@porcion/100}g\n#{@grasa_saturada*@porcion/100}g\n#{@grasa_monoinsaturada*@porcion/100}g\n#{@grasa_poliinsaturada*@porcion/100}g", "#{self.ir_grasa}%\n#{self.ir_grasa_saturada}%\n-\n-"], 
	   ["Hidratos de carbono\n -Azúcares\n -Polialcoholes\n -Almidón","#{@carbohidratos}g\n#{@azucar}g\n#{@polialcoholes}g\n#{@almidon}g","#{@carbohidratos*@porcion/100}g\n#{@azucar*@porcion/100}g\n#{@polialcoholes*@porcion/100}g\n#{@almidon*@porcion/100}g","#{self.ir_carbohidratos}%\n#{self.ir_azucar}%\n-\n-"], 
	   ["Fibra","#{@fibra}g","#{@fibra*@porcion/100}g","-"], 
	   ["Proteina","#{@proteina}g","#{@proteina*@porcion/100}g","#{self.ir_proteina}%"], 
	   ["Sal","#{@sal}g","#{@sal*@porcion/100}g","#{self.ir_sal}%"]]
tabla = Terminal::Table.new :title => "Galletas integrales", :headings => ['', 'Cantidad por 100g', "Cantidad por porción (20g)", "IR (por porción de #{@porcion}g de producto)"], :rows => filas
	"#{tabla}"
	end
end
