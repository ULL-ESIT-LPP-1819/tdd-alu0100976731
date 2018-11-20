require 'spec_helper'

RSpec::describe Individuo do
    context 'Método iniciales de clase Individuo' do
        before :each do
            @individuo1 = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
        end
        it 'El constructor funciona de forma adecuada' do
            prueba = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
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