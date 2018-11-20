require 'spec_helper'

RSpec::describe Individuo do
    context 'Método iniciales de clase Individuo' do
        it 'El constructor funciona de forma adecuada' do
            prueba = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
        end
    end
end