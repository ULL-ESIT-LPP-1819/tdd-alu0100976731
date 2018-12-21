require 'spec_helper'

RSpec::describe "Ordenación" do
  context "Métodos de ordenamiento lista" do
    before :all do
      @lista_individuos = Lista.new()
      #@lista_individuos.insert(IndividuoPaciente.new('Kyle', 'Maclachlan', 59, '22/02/1959','Hombre', 'Actor', 5, 98.5, 1.83, 77.2, 82.5, 0.54))
      #@lista_individuos.insert(IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 1,84.9, 1.85, 90, 100, 0.27))
      #@lista_individuos.insert(IndividuoPaciente.new('Alicia', 'Hernández González', 20, '27/09/1998','Mujer', 'Estudiante', 2, 62.8, 1.63, 69.6, 95.6, 0.12))
      #@lista_individuos.insert(IndividuoPaciente.new('Charlie', 'Parker', 41, '29/08/1977','Hombre', 'Músico', 3, 92.2, 1.75, 80.8, 96.8, 0))
      #@lista_individuos.insert(IndividuoPaciente.new('Nina', 'Simon', 24, '21/02/1994','Mujer', 'Cantante', 4, 52.4, 1.70, 67.2, 82.8, 0.27))
      #@lista_individuos.insert(IndividuoPaciente.new('John', 'Macarthy', 59, '22/02/1959','Hombre', 'Actor', 5, 75.4, 1.8, 77.2, 82.5, 0.54))
      #@lista_individuos.insert(IndividuoPaciente.new('Melisa', 'Asilem', 21, '22/08/1997','Mujer', 'Estudiante', 1, 86, 1.76, 90, 100, 0.27))
      #@lista_individuos.insert(IndividuoPaciente.new('Alba', 'Ranco', 43, '27/09/1998','Mujer', 'Estudiante', 2, 57.8, 1.53, 69.6, 95.6, 0.12))
      #@lista_individuos.insert(IndividuoPaciente.new('Luis', 'Wtf', 41, '29/08/1977','Hombre', 'Músico', 3, 82.2, 1.85, 80.8, 96.8, 0))
      #@lista_individuos.insert(IndividuoPaciente.new('Jose', 'Esoj', 24, '21/02/1994','Hombre', 'Cantante', 4, 72.4, 1.76, 67.2, 82.8, 0.27))
      @individuo0 = IndividuoPaciente.new('Kyle', 'Maclachlan', 59, '22/02/1959','Hombre', 'Actor', 5, 98.5, 1.83, 77.2, 82.5, 0.54)
      @individuo1 = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 1,84.9, 1.85, 90, 100, 0.27)
      @individuo2 = IndividuoPaciente.new('Alicia', 'Hernández González', 20, '27/09/1998','Mujer', 'Estudiante', 2, 62.8, 1.63, 69.6, 95.6, 0.12)
      @individuo3 = IndividuoPaciente.new('Charlie', 'Parker', 41, '29/08/1977','Hombre', 'Músico', 3, 92.2, 1.75, 80.8, 96.8, 0)
      @individuo4 = IndividuoPaciente.new('Nina', 'Simon', 24, '21/02/1994','Mujer', 'Cantante', 4, 52.4, 1.70, 67.2, 82.8, 0.27)
      @individuo5 = IndividuoPaciente.new('John', 'Macarthy', 59, '22/02/1959','Hombre', 'Actor', 5, 75.4, 1.8, 77.2, 82.5, 0.54)
      @individuo6 = IndividuoPaciente.new('Melisa', 'Asilem', 21, '22/08/1997','Mujer', 'Estudiante', 1, 86, 1.76, 90, 100, 0.27)
      @individuo7 = IndividuoPaciente.new('Alba', 'Ranco', 43, '27/09/1998','Mujer', 'Estudiante', 2, 57.8, 1.53, 69.6, 95.6, 0.12)
      @individuo8 = IndividuoPaciente.new('Luis', 'Wtf', 41, '29/08/1977','Hombre', 'Músico', 3, 82.2, 1.85, 80.8, 96.8, 0)
      @individuo9 = IndividuoPaciente.new('Jose', 'Esoj', 24, '21/02/1994','Hombre', 'Cantante', 4, 72.4, 1.76, 67.2, 82.8, 0.27)
      @lista_individuos.insert_array([@individuo0, @individuo1, @individuo2, @individuo3, @individuo4, @individuo5, @individuo6, @individuo7, @individuo8, @individuo9])
    end
    it "Existe un método de ordenamiento con bucles for" do
      expect(@lista_individuos.respond_to?:sort_for).to eq(true)
      #p @array_individuos.sort.collect{|x| x.nombre}
      #expect(@array_individuos.sort_for).to eq([@individuo7, @individuo2, @individuo4, @individuo8, @individuo3, @individuo6, @individuo9, @individuo5, @individuo1, individuo0])
    end
    it "El método sort_for funciona correctamente" do
      expect(@lista_individuos.sort_for).to eq([@individuo7, @individuo2, @individuo4, @individuo8, @individuo3, @individuo6, @individuo9, @individuo5, @individuo1, @individuo0])
    end
    it "El método sort_each funciona correctamente" do
      expect(@lista_individuos.sort_each).to eq([@individuo7, @individuo2, @individuo4, @individuo8, @individuo3, @individuo6, @individuo9, @individuo5, @individuo1, @individuo0])
    end
    it "El método sort funciona correctamente" do
      expect(@lista_individuos.sort).to eq([@individuo7, @individuo2, @individuo4, @individuo8, @individuo3, @individuo6, @individuo9, @individuo5, @individuo1, @individuo0])
    end
  end
  context "Pruebas menus" do
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
      @menu_dietetico1 = [@alimento1, @alimento2, @alimento3, @alimento4]
      @menu_dietetico2 = [@alimento5, @alimento2, @alimento6, @alimento7, @alimento8]
      @menu_dietetico3 = [@alimento2, @alimento1, @alimento7, @alimento7, @alimento8, @alimento8]
      @menu_dietetico4 = [@alimento1, @alimento9, @alimento10]
      @menu_dietetico5 = [@alimento2, @alimento11, @alimento12, @alimento7, @alimento5]
      @menu_dietetico6 = [@alimento1, @alimento2, @alimento3, @alimento4, @alimento5]
      @menu_dietetico7 = [@alimento5, @alimento2, @alimento6, @alimento7, @alimento8, @alimento3]
      @menu_dietetico8 = [@alimento2, @alimento1, @alimento7, @alimento7, @alimento8, @alimento8, @alimento12]
      @menu_dietetico9 = [@alimento1, @alimento9, @alimento10, @alimento2]
      @menu_dietetico0 = [@alimento2, @alimento11, @alimento12, @alimento7, @alimento5, @alimento10]
      @menus = [@menu_dietetico0, @menu_dietetico1, @menu_dietetico2, @menu_dietetico3, @menu_dietetico4, @menu_dietetico5, @menu_dietetico6, @menu_dietetico7, @menu_dietetico8, @menu_dietetico9]
    end
    it "Pruebas sort_for" do
      # p @menus.collect{|x| x.collect{|x| x.valor_energetico}.reduce(:+)}
      # p @menus.collect{|x| x.collect{|x| x.valor_energetico}.reduce(:+)}.sort
      # p @menus.sort_for
      expect(@menus.sort_for).to eq([@menu_dietetico1, @menu_dietetico4, @menu_dietetico9, @menu_dietetico2, @menu_dietetico3, @menu_dietetico5, @menu_dietetico6, @menu_dietetico7, @menu_dietetico0, @menu_dietetico8])
    end
  end
end