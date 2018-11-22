require 'spec_helper'

RSpec::describe Individuo do
    context 'Método iniciales de clase Individuo' do
        before :each do
            @individuo1 = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
        end
        it 'El constructor funciona de forma adecuada' do
            prueba = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
        end
        it 'Pertenece a la misma jerarquía que Object' do
            expect(@individuo1).to be_kind_of(Object)
        end
        it 'Comprobando getters' do
            expect(@individuo1.nombre).to eq('Juan Jesús')
            expect(@individuo1.apellidos).to eq('Padrón Hernández')
            expect(@individuo1.edad).to eq(21)
            expect(@individuo1.f_nacimiento).to eq('22/08/1997')
            expect(@individuo1.genero).to eq('Hombre')
            expect(@individuo1.ocupacion).to eq('Estudiante')
        end
        it 'Comprobando método to_s' do
            expect(@individuo1.to_s).to eq("INDIVIDUO\n-Nombre: Juan Jesús\n-Apellidos: Padrón Hernández\n-Edad: 21\n-Fecha de nacimiento: 22/08/1997\n-Género: Hombre\n-Ocupación: Estudiante")
        end
    end
end

RSpec::describe IndividuoPaciente do
    before :each do
        @individuo1 = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 85, 1.85, 90, 100)
    end
    context 'Métodos iniciales' do
        it 'Existe un constructor' do
            prueba = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 85, 1.85, 90, 100)
        end
        it 'Comprobando getters' do
            expect(@individuo1.nombre).to eq('Juan Jesús')
            expect(@individuo1.apellidos).to eq('Padrón Hernández')
            expect(@individuo1.edad).to eq(21)
            expect(@individuo1.f_nacimiento).to eq('22/08/1997')
            expect(@individuo1.genero).to eq('Hombre')
            expect(@individuo1.ocupacion).to eq('Estudiante')
            expect(@individuo1.peso).to eq(84.9)
            expect(@individuo1.talla).to eq(1.85)
            expect(@individuo1.c_cintura).to eq(90)
            expect(@individuo1.c_cadera).to eq(100)
        end
    end
    context 'Comprobando clase, tipo y pertenencia a una jerarquía' do
        it 'El objeto es una instancia de IndividuoPaciente'  do
            expect(@individuo1).to be_instance_of(IndividuoPaciente)
        end
        it 'El objeto es de la clase IndividuoPaciente'  do
            expect(@individuo1.class).to be(IndividuoPaciente)
        end
        it 'Pertenece a la jerarquía de clase de Individuo' do
            expect(@individuo1).to be_kind_of(Individuo)
        end
    end
    context 'Cálculo de datos antropométricos' do
        it 'Método para calcular el IMC' do
            expect(@individuo1.imc).to eq(24.81)
        end
        it 'Pordentaje de grasa' do
            expect(@individuo1.p_grasa).to eq(18.4)
        end
    end
end