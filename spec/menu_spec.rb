require 'spec_helper'

RSpec::describe "Menú dietético" do
  before :all do
    @alimento1 = InfoNutricional.new("Galletas integrales", 100, 12.6, 1.2, 70.0, 21.0, 7.3, 0.003, 9.9, 1.5, 0.0, 0.0, 7.5)
		@alimento2 = InfoNutricional.new("Leche entera", 250, 3.6, 2.5, 4.7, 4.7, 3.0, 0.13)
		@alimento3 = InfoNutricional.new("Oroweat 12 cereales y semillas", 80, 5.9, 0.8, 42, 5.5, 11.0, 0.98, 1.8, 3.3, 0.0, 36.0, 6.0)
		@alimento4 = InfoNutricional.new("Anchoas", 200, 13, 1.8, 0.5, 0.5, 25, 14.3)
    @alimento5 = InfoNutricional.new("Chocolate 85%", 500, 46.0, 28.0, 22.0, 15.0, 12.0, 0.02, 14.0, 1.6, nil, nil, 15)

    @menu_dietetico1 = [@alimento1, @alimento2, @alimento3, @alimento4]
    @menu_dietetico2 = [@alimento5]

    @individuo1 = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 1,84.9, 1.85, 90, 100, 0.27)
    @individuo2 = IndividuoPaciente.new('Alicia', 'Hernández González', 20, '27/09/1998','Mujer', 'Estudiante', 2, 62.8, 1.63, 69.6, 95.6, 0.12)
    @individuo3 = IndividuoPaciente.new('Charlie', 'Parker', 41, '29/08/1977','Hombre', 'Músico', 3, 92.2, 1.75, 80.8, 96.8, 0)
    @individuo4 = IndividuoPaciente.new('Nina', 'Simon', 24, '21/02/1994','Mujer', 'Cantante', 4, 52.4, 1.70, 67.2, 82.8, 0.27)
    @individuo5 = IndividuoPaciente.new('Kyle', 'Maclachlan', 59, '22/02/1959','Hombre', 'Actor', 5, 98.5, 1.83, 77.2, 82.5, 0.54)
  end
  context "Comprobando menús" do
    
  end
end