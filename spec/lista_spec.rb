require 'spec_helper'

RSpec::describe "Lista" do
	before :all do
		@lista = Lista.new()
		@alimento1 = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 70.0, 21.0, 7.3, 0.003, 9.9, 1.5, 0.0, 0.0, 7.5)
		@alimento2 = InfoNutricional.new("Leche entera", 250, 3.6, 2.5, 4.7, 4.7, 3.0, 0.13)
		@alimento3 = InfoNutricional.new("Oroweat 12 cereales y semillas", 20, 5.9, 0.8, 42, 5.5, 11.0, 0.98, 1.8, 3.3, 0.0, 36.0, 6.0)
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
	end
	context "# Mostrar por pantalla" do
		it "El método to_s funciona correctamente" do
			@lista.push_back(@alimento1)
			@lista.push_back(@alimento2)
			@lista.push_back(@alimento3)

			expect(@lista.to_s).to eq("#{@alimento1.nombre} <-> #{@alimento2.nombre} <-> #{@alimento3.nombre}")
		end
	end
end