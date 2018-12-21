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
end