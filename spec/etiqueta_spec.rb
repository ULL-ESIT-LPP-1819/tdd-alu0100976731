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
  end
end

#RSpec.describe InfoNutricional do
#	context "# Probando el constructor" do
#		it "Espectativa de que existe un constructor" do
#			prueba = InfoNutricional.new("Galletas integrales", 20, 12.6, 1.2, 9.9, 1.5, 70.0, 21.0, 7.5, 7.3, 0.003)
#		end
#	end
#end
