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
  end
end

