# La clase InfoNutricional representa la información nutricional
# de un alimento.
# Se ha hecho Comparable.
#
# @author Juan Jesús Padrón Hernández  (mailto:alu0100976731@ull.edu.es)
class InfoNutricional
	include Comparable
	attr_reader :nombre, :porcion, :grasa, :grasa_saturada, :grasa_monoinsaturada, :grasa_poliinsaturada, :carbohidratos, :azucar, :polialcoholes, :almidon, :fibra, :proteina, :sal
	# Inicializa el objeto con los parámetro indicados.
	# @param nombre [String] Nombre del alimento.
	# @param porcion [Numeric] Tamaño de la porción.
	# @param grasa [Numeric] Cantidad de grasa.
	# @param grasa_saturada [Numeric] Cantidad de grasa saturada.
	# @param carbohidratos [Numeric] Cantidad de hidratos de carbono o carbohidratos.
	# @param azucar [Numeric] Cantidad de azúcar.
	# @param proteina [Numeric] Cantidad de proteina.
	# @param sal [Numeric] Cantidad de sal.
	# @param otros [Array] Atributos opcionales: grasa_monoinsaturada, grasa_poliinsaturada, polialcoholes, almido, fibra.
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

	# Calcula el valor energético del alimento.
	# @return [Numeric] Cantidad de kcal que aporta el alimento.
	def valor_energetico
		(@grasa*9+@carbohidratos*4+@proteina*4+@sal*6).round
	end

	# Calcula el porcentaje de la ingesta recomendada de kcal que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de calorías de la ingesta diaria recomendada.
	def ir_kcal
		(valor_energetico.to_f*@porcion/2000).round(2)
	end

	# Calcula el porcentaje de la ingesta recomendad de grasa que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de grasa de la ingesta diaria recomendada.
	def ir_grasa
		(@grasa.to_f*@porcion/70).round(2)
	end

	# Calcula el porcentaje de la ingesta recomendad de grasa saturada que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de grasa saturada de la ingesta diaria recomendada.
	def ir_grasa_saturada
		(@grasa_saturada.to_f*@porcion/20).round(2)
	end

	# Calcula el porcentaje de la ingesta recomendad de hidratos de carbono que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de hidratos de carbono de la ingesta diaria recomendada.
	def ir_carbohidratos
		(@carbohidratos.to_f*@porcion/260).round(2)
	end
	
	# Calcula el porcentaje de la ingesta recomendad de azucar que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de azucar de la ingesta diaria recomendada.
	def ir_azucar
		(@azucar.to_f*@porcion/90).round(2)
	end

	# Calcula el porcentaje de la ingesta recomendad de proteina que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de proteina de la ingesta diaria recomendada.
	def ir_proteina
		(@proteina.to_f*@porcion/50).round(2)
	end

	# Calcula el porcentaje de la ingesta recomendad de sal que posee la porción indicada del alimento.
	# @return [Numeric] Porcentaje de sal de la ingesta diaria recomendada.
	def ir_sal
		(@sal.to_f*@porcion/6).round(2)
	end

	# Devulve la cadena con la información nutricional del alimento.
	# @return [String] Cadena con la información nutricional del alimento
	def to_s
		if @grasa_monoinsaturada != nil
			v_grasa_monoinsaturada = @grasa_monoinsaturada*@porcion/100
		else
			v_grasa_monoinsaturada = ""
		end
		if @grasa_poliinsaturada != nil
			v_grasa_poliinsaturada = @grasa_poliinsaturada*@porcion/100
		else
			v_grasa_poliinsaturada = ""
		end
		if @almidon != nil
			v_almidon = @almidon*@porcion/100
		else
			v_almidon = ""
		end
		if @polialcoholes != nil
			v_polialcoholes = @polialcoholes*@porcion/100
		else
			v_polialcoholes = ""
		end
		if @fibra != nil
			v_fibra = @fibra*@porcion/100
		else
			v_fibra = ""
		end
		filas = [["Valor energético","#{(valor_energetico*4.1868).round}kJ/ #{valor_energetico}kcal", "#{(valor_energetico*4.1686*@porcion/100).round}kJ/ #{(valor_energetico*@porcion/100).round}kcal","#{self.ir_kcal}%"], 
	   ["Grasas totales\n -Saturadas\n -Monoinsaturada\n -Poliinsaturada", "#{@grasa}g\n#{@grasa_saturada}g\n#{@grasa_monoinsaturada}g\n#{@grasa_poliinsaturada}g", "#{@grasa*@porcion/100}g\n#{@grasa_saturada*@porcion/100}g\n#{v_grasa_monoinsaturada}g\n#{v_grasa_poliinsaturada}g", "#{self.ir_grasa}%\n#{self.ir_grasa_saturada}%\n-\n-"], 
	   ["Hidratos de carbono\n -Azúcares\n -Polialcoholes\n -Almidón","#{@carbohidratos}g\n#{@azucar}g\n#{@polialcoholes}g\n#{@almidon}g","#{@carbohidratos*@porcion/100}g\n#{@azucar*@porcion/100}g\n#{v_polialcoholes}g\n#{v_almidon}g","#{self.ir_carbohidratos}%\n#{self.ir_azucar}%\n-\n-"], 
	   ["Fibra","#{@fibra}g","#{v_fibra}g","-"], 
	   ["Proteina","#{@proteina}g","#{@proteina*@porcion/100}g","#{self.ir_proteina}%"], 
	   ["Sal","#{@sal}g","#{@sal*@porcion/100}g","#{self.ir_sal}%"]]
tabla = Terminal::Table.new :title => "Galletas integrales", :headings => ['', 'Cantidad por 100g', "Cantidad por porción (20g)", "IR (por porción de #{@porcion}g de producto)"], :rows => filas
	"#{tabla}"
	end

	# Define la clase como Comparable. Compara los alimentos por su valor energético.
	def <=>(other)
		valor_energetico <=> other.valor_energetico
	end
end
