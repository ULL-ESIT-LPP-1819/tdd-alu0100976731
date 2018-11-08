class InfoNutricional
	attr_reader :nombre, :porcion, :grasa, :grasa_saturada, :grasa_monoinsaturada, :grasa_poliinsaturada, :carbohidratos, :azucar, :polialcoholes, :almidon, :fibra, :proteina, :sal
	def initialize(nombre, porcion, grasa, grasa_saturada, grasa_monoinsaturada, grasa_poliinsaturada, carbohidratos, azucar, polialcoholes, almidon, fibra, proteina, sal)
		@nombre, @porcion, @grasa, @grasa_saturada, @grasa_monoinsaturada, @grasa_poliinsaturada, @carbohidratos, @azucar, @polialcoholes, @almidon, @fibra, @proteina, @sal = nombre, porcion, grasa, grasa_saturada, grasa_monoinsaturada, grasa_poliinsaturada, carbohidratos, azucar, polialcoholes, almidon, fibra, proteina, sal
	end
end
