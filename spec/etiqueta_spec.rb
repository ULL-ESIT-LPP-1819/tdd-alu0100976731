require 'etiqueta'
require 'spec_helper'
RSpec.describe Etiqueta do
  it "has a version number" do
    expect(Etiqueta::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
  
  context "# Probando el constructor" do
                it "Espectativa de que existe un constructor" do
			prueba = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 9.9, 1.5, 70.0, 21.0, 0.0, 0.0, 7.5, 7.3, 0.003)
                end
		before :each do
			@etiqueta = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 9.9, 1.5, 70.0, 21.0, 0.0, 0.0, 7.5, 7.3, 0.003)
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
end

