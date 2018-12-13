require 'spec_helper'

RSpec::describe Lista do
	before :all do
		@lista = Lista.new()
		@alimento1 = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 70.0, 21.0, 7.3, 0.003, 9.9, 1.5, 0.0, 0.0, 7.5)
		@alimento2 = InfoNutricional.new("Leche entera", 250, 3.6, 2.5, 4.7, 4.7, 3.0, 0.13)
		@alimento3 = InfoNutricional.new("Oroweat 12 cereales y semillas", 20, 5.9, 0.8, 42, 5.5, 11.0, 0.98, 1.8, 3.3, 0.0, 36.0, 6.0)
		@alimento4 = InfoNutricional.new("Anchoas", 50, 13, 1.8, 0.5, 0.5, 25, 14.3)
		@alimento5 = InfoNutricional.new("Chocolate 85%", 20, 46.0, 28.0, 22.0, 15.0, 12.0, 0.02, 14.0, 1.6, nil, nil, 15)
	end
	context "# Métodos iniciales" do
		it "Comprobando que existe una estructura Nodo" do
			nodo = Node.new(nil, nil, nil)
		end
		it "Comprobando que existe un constructor" do
			prueba = Lista.new()
		end
		it "Comprobando que existe una cabeza y una cola" do
			expect(@lista.head).to be nil
			expect(@lista.tail).to be nil
		end
	end
	context "# Utilidades de la lista" do
		it "Existe un método que inserta un elemento por delante con la lista vacía" do
			@lista.push_front(@alimento1)
			expect(@lista.head.value).to eq(@alimento1)
		end
		it "Además, el método puede insertar un elemento por delante si la lista no está vacía" do
			@lista.push_front(@alimento2)
			@lista.push_front(@alimento3)
			expect(@lista.head.value).to eq(@alimento3)
			expect(@lista.head.next.value).to eq(@alimento2)
			expect(@lista.head.next.next.value).to eq(@alimento1)
			expect(@lista.head.next.prev.value).to eq(@alimento3)
			expect(@lista.tail.value).to eq(@alimento1)
			expect(@lista.tail.prev.value).to eq(@alimento2)
		end
		it "Existe un método que elimina un nodo de la lista por delante" do
			expect(@lista.shift).to eq(@alimento3)
			expect(@lista.head.value).to eq(@alimento2)
			expect(@lista.head.prev).to be nil
			expect(@lista.shift).to eq(@alimento2)
			expect(@lista.shift).to eq(@alimento1)
			expect(@lista.head).to be nil
			expect(@lista.tail).to be nil 
		end
		it "Existe un método que inserta un elemento por detrás" do
			@lista.push_back(@alimento1)
			expect(@lista.tail.value).to eq(@alimento1)
			
			@lista.push_back(@alimento2)
			expect(@lista.tail.value).to eq(@alimento2)
			expect(@lista.tail.prev.next.value).to eq(@alimento2)
			expect(@lista.tail.prev.prev).to be nil

			@lista.push_back(@alimento3)
			expect(@lista.tail.value).to eq(@alimento3)
		end
		it "Existe un método que elimina un nodo de la lista por detrás" do
			expect(@lista.pop).to eq(@alimento3)
			expect(@lista.tail.value).to eq(@alimento2)
			expect(@lista.tail.next).to be nil

			expect(@lista.pop).to eq(@alimento2)
			expect(@lista.pop).to eq(@alimento1)
			expect(@lista.head).to be nil
			expect(@lista.tail).to be nil
		end
		it "Método que comprueba si la lista está vacía" do
			prueba = Lista.new()
			expect(prueba.empty?).to eq(true)
			prueba.push_back(@alimento1)
			expect(prueba.empty?).to eq(false)
		end
	end
	context "# Mostrar por pantalla" do
		it "El método to_s funciona correctamente" do
			@lista.push_back(@alimento1)
			@lista.push_back(@alimento2)
			@lista.push_back(@alimento3)

			expect(@lista.to_s).to eq("#{@alimento1.to_s} <-> #{@alimento2.to_s} <-> #{@alimento3.to_s}")
			@lista.pop
			@lista.pop
			expect(@lista.to_s).to eq("#{@alimento1.to_s}")
		end
	end
	context "# Más utilidades" do
		it "Devuelve el número de nodos" do
			@lista.pop
			expect(@lista.size).to eq(0)
			@lista.push_back(@alimento1)
			@lista.push_back(@alimento2)
			@lista.push_back(@alimento3)
			expect(@lista.size).to eq(3)
		end
		it "Creando método que devuelve el valor de la posición dada" do
			expect(@lista.get(2)).to eq(@alimento3)
			expect(@lista.get(1)).to eq(@alimento2)
			expect(@lista.get(0)).to eq(@alimento1)
		end
		it "Creando método que inserta en una posición dada" do
			@lista.insert(0,@alimento4)
			expect(@lista.get(0)).to eq(@alimento4)
			@lista.insert(2,@alimento5)
			expect(@lista.get(2)).to eq(@alimento5)
			@lista.insert(5,@alimento1)
			expect(@lista.get(5)).to eq(@alimento1)
		end
		it "Creando método que elimina el nodo de una posición dada" do
			@lista.erase(0)
			@lista.erase(4)
			@lista.erase(1)
			expect(@lista.to_s).to eq("#{@alimento1} <-> #{@alimento2} <-> #{@alimento3}")
			# 4 1 5 2 3 1
			# 0 1 2 3 4 5
			# 1 2 3
			@lista.push_back(@alimento4)
			@lista.push_back(@alimento5)
		end
	end
	context "Pruebas para clasificar según los gramos de sal" do
		before :all do
			@lista_mayor = Lista.new()
			@lista_menor = Lista.new()
		end
		it "Se clasifica según la sal correctamente" do
			aux = @lista.head
			while aux!=nil
				if aux.value.sal > 6
					@lista_mayor.push_back(aux.value)
					expect(aux.value).to eq(@alimento4)
				else
					@lista_menor.push_back(aux.value)
				end
				aux = aux.next
			end
			expect(@lista_mayor.size).to eq(1)
			expect(@lista_menor.size).to eq(4)
		end
	end
	context "Pruebas Enumerable con etiquetas nutricionales" do
		before :all do
			@lista = Lista.new()
			@lista.push_back(InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 70.0, 21.0, 7.3, 0.003, 9.9, 1.5, 0.0, 0.0, 7.5))
			@lista.push_back(InfoNutricional.new("Leche entera", 250, 3.6, 2.5, 4.7, 4.7, 3.0, 0.13))
			@lista.push_back(InfoNutricional.new("Oroweat 12 cereales y semillas", 20, 5.9, 0.8, 42, 5.5, 11.0, 0.98, 1.8, 3.3, 0.0, 36.0, 6.0))
			@lista.push_back(InfoNutricional.new("Anchoas", 50, 13, 1.8, 0.5, 0.5, 25, 14.3))
			@lista.push_back(InfoNutricional.new("Chocolate 85%", 20, 46.0, 28.0, 22.0, 15.0, 12.0, 0.02, 14.0, 1.6, nil, nil, 15))
		end
		it "Responde al operador each" do
			expect(@lista.respond_to?:each).to eq(true)
		end
		it "El operador max funciona correctamente" do
			expect(@lista.max).to eq(@lista[4])
		end
		it "El operador min funciona correctamente" do
			expect(@lista.min).to eq(@lista[1])
		end
		it "El operador collect funciona correctamente" do
			expect(@lista.collect{"Work!"}).to eq(["Work!","Work!","Work!","Work!","Work!"])
		end
		it "El operador select funciona correctamente" do
			expect(@lista.select{|alimento| alimento.valor_energetico > 300}).to eq([@lista[0], @lista[3], @lista[4]])
		end
		it "El operador sort funciona correctamente" do
			expect(@lista.sort).to eq([@lista[1], @lista[2], @lista[3], @lista[0], @lista[4]])
		end
	end
	context "Pruebas Enumerable con valoraciones nutricionales de individuos pacientes" do
		before :all do
			@individuos = Lista.new()
      @individuos.push_back(IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 1,84.9, 1.85, 90, 100, 0.27))
      @individuos.push_back(IndividuoPaciente.new('Alicia', 'Hernández González', 20, '27/09/1998','Mujer', 'Estudiante', 2, 62.8, 1.63, 69.6, 95.6, 0.12))
      @individuos.push_back(IndividuoPaciente.new('Charlie', 'Parker', 41, '29/08/1977','Hombre', 'Músico', 3, 92.2, 1.75, 80.8, 96.8, 0))
      @individuos.push_back(IndividuoPaciente.new('Nina', 'Simon', 24, '21/02/1994','Mujer', 'Cantante', 4, 52.4, 1.70, 67.2, 82.8, 0.27))
      @individuos.push_back(IndividuoPaciente.new('Kyle', 'Maclachlan', 59, '22/02/1959','Hombre', 'Actor', 5, 98.5, 1.83, 77.2, 82.5, 0.54))
		end
		it "El operador max funciona correctamente" do
			expect(@individuos.max).to eq(@individuos[2])
		end
		it "El operador min funciona correctamente" do
			expect(@individuos.min).to eq(@individuos[3])
		end
		it "El operador collect funciona correctamente" do
			expect(@individuos.collect{"Work!"}).to eq(["Work!","Work!","Work!","Work!","Work!"])
		end
		it "El operador select funciona correctamente" do
			expect(@individuos.select{|individuo| individuo.imc < 25}).to eq([@individuos[0], @individuos[1], @individuos[3]])
		end
		it "El operador sort funciona correctamente" do
			expect(@individuos.sort).to eq([@individuos[3], @individuos[1], @individuos[0], @individuos[4], @individuos[2]])
		end
	end
end
