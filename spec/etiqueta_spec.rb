require 'etiqueta'
require 'spec_helper'
require 'terminal-table'
RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
  before :each do
                @etiqueta = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 9.9, 1.5, 70.0, 21.0, 0.0, 0.0, 7.5, 7.3, 0.003)
        end
  context "# Probando el constructor" do
                it "Espectativa de que existe un constructor" do
			prueba = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 9.9, 1.5, 70.0, 21.0, 0.0, 0.0, 7.5, 7.3, 0.003)
                end
		it "Espectativa de que los elementos existen" do
			expect(@etiqueta.nombre).not_to be nil
			expect(@etiqueta.porcion).not_to be nil
			expect(@etiqueta.grasa).not_to be nil
			expect(@etiqueta.grasa_saturada).not_to be nil
			expect(@etiqueta.grasa_monoinsaturada).not_to be nil
			expect(@etiqueta.grasa_poliinsaturada).not_to be nil
			expect(@etiqueta.carbohidratos).not_to be nil
			expect(@etiqueta.azucar).not_to be nil
			expect(@etiqueta.polialcoholes).not_to be nil
			expect(@etiqueta.almidon).not_to be nil
			expect(@etiqueta.fibra).not_to be nil
			expect(@etiqueta.proteina).not_to be nil
			expect(@etiqueta.sal).not_to be nil
		end
		it "Se almacena correctamente el nombre" do
        	        expect(@etiqueta.nombre).to eq("Galletas integrales")
	        end
		it "Se almacena correctamente la porción" do 
			expect(@etiqueta.porcion).to eq(20)
		end
		it "Se almacena correctamente la grasa" do
			expect(@etiqueta.grasa).to eq(12.6)
                end
		it "Se almacena correctamente la grasa saturada" do
			expect(@etiqueta.grasa_saturada).to eq(1.2)
                end
		it "Se almacena correctamente la grasa monoinsaturada" do
			expect(@etiqueta.grasa_monoinsaturada).to eq(9.9)
                end
		it "Se almacena correctamente la grasa poliinsaturada" do
			expect(@etiqueta.grasa_poliinsaturada).to eq(1.5)
                end
		it "Se almacena correctamente la cantidad de carbohidratos" do
			expect(@etiqueta.carbohidratos).to eq(70.0)
                end
		it "Se almacena correctamente el azúcar" do
			expect(@etiqueta.azucar).to eq(21.0)
                end
		it "Se almacenan correctamente los polialcoholes" do
			expect(@etiqueta.polialcoholes).to eq(0.0)
                end
		it "Se almacena correctamente el almidón " do
			expect(@etiqueta.almidon).to eq(0.0)
                end
		it "Se almacena correctamente la fibra" do
			expect(@etiqueta.fibra).to eq(7.5)
                end
		it "Se almacena correctamente la proteina" do
			expect(@etiqueta.proteina).to eq(7.3)
                end
		it "Se almacena correctamente la sal" do
			expect(@etiqueta.sal).to eq(0.003)
                end
  end
  context "# Métodos adicionales" do
	it "Espectativa para método valor_energetico" do
		expect(@etiqueta.valor_energetico).to eq(438)
	end
  end
  context "# Métodos para mostrar por pantalla" do
	  it "Espectativa para método to_s, tabla formateada" do
		  filas = [["Valor energético","1834kJ/ 438kcal", "365kJ/ 87kcal"], 
	     ["Grasas totales\n -Saturadas\n -Monoinsaturada\n -Poliinsaturada", "12.6g\n1.2g\n9.9g\n1.5g", "2.52g\n0.24g\n1.98g\n0.3g"], 
	     ["Hidratos de carbono\n -Azúcares\n -Polialcoholes\n -Almidón","70.0g\n21.0g\n0.0g\n0.0g","14.0g\n4.2g\n0.0g\n0.0g"], 
	     ["Fibra","7.5g","1.5g"], 
	     ["Proteina","7.3g","1.46g"], 
	     ["Sal","0.003g","0.0006g"]]
		tabla = Terminal::Table.new :title => "Galletas integrales", :headings => ['', 'Cantidad por 100g', "Cantidad por porción (20g)"], :rows => filas
		expect("#{@etiqueta.to_s}").to eq("#{tabla}")
	  end
  end
  context "# Ingesta recomendada (IR)" do
	it "Método ingesta recomendada kcal" do
		expect(@etiqueta.ir_kcal).to eq(4.38)
	end
	it "Método ingesta recomendad grasa" do
		expect(@etiqueta.ir_grasa).to eq(3.6)
	end	
  end
end

