require 'spec_helper'

RSpec::describe "Menú dietético" do
  before :all do
    @alimento1 = InfoNutricional.new("Galletas integrales", 100, 12.6, 1.2, 70.0, 21.0, 7.3, 0.003, 9.9, 1.5, 0.0, 0.0, 7.5)
		@alimento2 = InfoNutricional.new("Leche entera", 250, 3.6, 2.5, 4.7, 4.7, 3.0, 0.13)
		@alimento3 = InfoNutricional.new("Oroweat 12 cereales y semillas", 80, 5.9, 0.8, 42, 5.5, 11.0, 0.98, 1.8, 3.3, 0.0, 36.0, 6.0)
		@alimento4 = InfoNutricional.new("Anchoas", 200, 13, 1.8, 0.5, 0.5, 25, 14.3)
    @alimento5 = InfoNutricional.new("Chocolate 85%", 50, 46.0, 28.0, 22.0, 15.0, 12.0, 0.02, 14.0, 1.6, nil, nil, 15)
    @alimento6 = InfoNutricional.new("Lentejas", 200, 1, 0, 40, 1, 23, 0.024, 0, 0, 0, nil, 17)
    @alimento7 = InfoNutricional.new("Pecuga de pollo", 200, 3, 1, 0, 0, 31, 0.0074)
    @alimento8 = InfoNutricional.new("Arroz blanco", 200, 1, 0, 75, 5, 8, 0)
    @alimento9 = InfoNutricional.new("Hamburguesa", 200, 27, 13, 34, 9, 32, 0)
    @alimento10 = InfoNutricional.new("Pizza barbacoa", 300, 10, 4, 36, 4, 12, 0)
    @alimento11 = InfoNutricional.new("Gofio", 100, 3, 0, 81, 0, 11, 0)
    @alimento12 = InfoNutricional.new("Garbanzos", 200, 6, 0, 61, 11, 19, 0.024, 1, 2, nil, nil, 17)
    # def initialize(nombre, porcion, grasa, grasa_saturada, carbohidratos, azucar, proteina, sal, 
    # grasa_monoinsaturada,grasa_poliinsaturada = otros[1] ,polialcoholes = otros[2] ,almidon = otros[3] ,fibra = otros[4])
    @menu_dietetico1 = [@alimento1, @alimento2, @alimento3, @alimento4]
    @menu_dietetico2 = [@alimento5, @alimento2, @alimento6, @alimento7, @alimento8]
    @menu_dietetico3 = [@alimento2, @alimento1, @alimento7, @alimento7, @alimento8, @alimento8]
    @menu_dietetico4 = [@alimento1, @alimento9, @alimento10]
    @menu_dietetico5 = [@alimento2, @alimento11, @alimento12, @alimento7, @alimento5]

    @menus = [@menu_dietetico1, @menu_dietetico2, @menu_dietetico3, @menu_dietetico4, @menu_dietetico5]

    @individuo1 = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 1,84.9, 1.85, 90, 100, 0.27)
    @individuo2 = IndividuoPaciente.new('Alicia', 'Hernández González', 20, '27/09/1998','Mujer', 'Estudiante', 2, 62.8, 1.63, 69.6, 95.6, 0.12)
    @individuo3 = IndividuoPaciente.new('Charlie', 'Parker', 41, '29/08/1977','Hombre', 'Músico', 3, 92.2, 1.75, 80.8, 96.8, 0)
    @individuo4 = IndividuoPaciente.new('Nina', 'Simon', 24, '21/02/1994','Mujer', 'Cantante', 4, 52.4, 1.70, 67.2, 82.8, 0.27)
    @individuo5 = IndividuoPaciente.new('Kyle', 'Maclachlan', 59, '22/02/1959','Hombre', 'Actor', 5, 98.5, 1.83, 77.2, 82.5, 0.54)
    @pacientes = [@individuo1,@individuo2,@individuo3,@individuo4,@individuo5]
    @gasto5 = @individuo5.gasto_energetico_total
    @gasto4 = @individuo4.gasto_energetico_total
    @gasto3 = @individuo3.gasto_energetico_total
    @gasto2 = @individuo2.gasto_energetico_total
    @gasto1 = @individuo1.gasto_energetico_total
  end
  context "Pruebas individuales" do
    it "Probando individuos 1 a 1" do
      expect(@menu_dietetico2.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto3*0.9,@gasto3*1.1)).to eq(true)
      expect(@menu_dietetico2.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto2*0.9,@gasto2*1.1)).to eq(false)
      expect(@menu_dietetico3.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto1*0.9,@gasto1*1.1)).to eq(true)
    end
    it "Buscando qué individuos de una lista cumplen con determinado menú" do
      expect(@pacientes.select{|x| @menu_dietetico2.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(x.gasto_energetico_total*0.9,x.gasto_energetico_total*1.1)}).to eq([@individuo3,@individuo4])
      expect(@pacientes.select{|x| @menu_dietetico3.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(x.gasto_energetico_total*0.9,x.gasto_energetico_total*1.1)}).to eq([@individuo1])
    end
    it "Buscando cuales de un conjunto de menús sirven para un individuo" do
      expect(@menus.select{|x| x.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto1*0.9,@gasto1*1.1)}).to eq([@menu_dietetico3])
      expect(@menus.select{|x| x.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto2*0.9,@gasto2*1.1)}).to eq([])
      expect(@menus.select{|x| x.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto3*0.9,@gasto3*1.1)}).to eq([@menu_dietetico2, @menu_dietetico5])
      expect(@menus.select{|x| x.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto4*0.9,@gasto4*1.1)}).to eq([@menu_dietetico2,@menu_dietetico5])
      expect(@menus.select{|x| x.collect{|i| i.valor_energetico_porcion}.reduce(:+).between?(@gasto5*0.9,@gasto5*1.1)}).to eq([])
    end
  end

end