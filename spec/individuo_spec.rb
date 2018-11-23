require 'spec_helper'

RSpec::describe Individuo do
    context 'Método iniciales de clase Individuo' do
        before :each do
            @individuo1 = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
        end
        it 'El constructor funciona de forma adecuada' do
            prueba = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
        end
        it 'El objeto @individuo es una instancia de Individuo' do
            expect(@individuo1).to be_instance_of(Individuo)
            expect(@individuo1.instance_of?Individuo).to be(true)
        end
        it 'Pertenece a la misma jerarquía que Object' do
            expect(@individuo1).to be_kind_of(Object)
            expect(@individuo1.is_a?Object).to be(true)
        end
        it 'ICM no pertenece a su tipo' do
            expect(@individuo1.respond_to?:imc).to be(false)
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
        @individuo1 = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 84.9, 1.85, 90, 100)
    end
    context 'Métodos iniciales' do
        it 'Existe un constructor' do
            prueba = IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 84.9, 1.85, 90, 100)
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
        it 'Comprobando método to_s' do
            expect(@individuo1.to_s).to eq("INDIVIDUO\n-Nombre: Juan Jesús\n-Apellidos: Padrón Hernández\n-Edad: 21\n-Fecha de nacimiento: 22/08/1997\n-Género: Hombre\n-Ocupación: Estudiante\n-Peso: 84.9\n-Talla: 1.85\n-Circ. Cintura: 90\n-Circ. Cadera: 100\n-IMC: 24.81\n-RCC: 0.9")
        end
    end
    context 'Comprobando clase, tipo y pertenencia a una jerarquía' do
        it 'El objeto es una instancia de IndividuoPaciente'  do
            expect(@individuo1).to be_instance_of(IndividuoPaciente)
            expect(@individuo1.instance_of?IndividuoPaciente).to be(true)
        end
        it 'El objeto es de la clase IndividuoPaciente'  do
            expect(@individuo1.class).to be(IndividuoPaciente)
        end
        it 'Pertenece a la jerarquía de clase de Individuo' do
            expect(@individuo1).to be_kind_of(Individuo)
            expect(@individuo1.is_a?Individuo).to be(true)
        end
        it 'Comprobaciones de tipo' do
            expect(@individuo1.respond_to?:imc).to be(true)
        end
    end
    context 'Cálculo de datos antropométricos' do
        it 'Método para calcular el IMC' do
            expect(@individuo1.imc).to eq(24.81)
        end
        it 'Pordentaje de grasa' do
            expect(@individuo1.p_grasa).to eq(18.40)
        end
        it 'Relación Cadera-Cintura' do
            expect(@individuo1.rcc).to eq(0.9)
        end
    end
    context 'Clasificación de lista' do
        before :all do
            @individuos = Lista.new()
            @individuos.push_back(IndividuoPaciente.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante', 84.9, 1.85, 90, 100))
            @individuos.push_back(IndividuoPaciente.new('Alicia', 'Hernández González', 20, '27/09/1998','Mujer', 'Estudiante', 62.8, 1.63, 69.6, 95.6))
            @individuos.push_back(IndividuoPaciente.new('Charlie', 'Parker', 41, '29/08/1977','Hombre', 'Músico', 92.2, 1.75, 80.8, 96.8))
            @individuos.push_back(IndividuoPaciente.new('Nina', 'Simon', 24, '21/02/1994','Mujer', 'Cantante', 52.4, 1.70, 67.2, 82.8))
            @individuos.push_back(IndividuoPaciente.new('Kyle', 'Maclachlan', 59, '22/02/1959','Hombre', 'Actor', 98.5, 1.83, 77.2, 82.5))
        end
        it 'Clasificanco individuos' do
            expect(@individuos).to be_instance_of(Lista)
            expect(@individuos.instance_of?Lista).to be(true)
            expect(@individuos).to be_kind_of(Object)
            aux = @individuos.head
            bajo_peso = Lista.new()
            aceptable = Lista.new()
            sobrepeso = Lista.new()
            obesidad1 = Lista.new()
            obesidad2 = Lista.new()
            obesidad3 = Lista.new()
            while aux!=nil
                expect(aux.value.respond_to?:imc).to be(true)
                if aux.value.imc < 18.5
                    bajo_peso.push_back(@individuos.shift)
                    aux = @individuos.head
                elsif aux.value.imc >= 18.5 && aux.value.imc <= 24.9
                    aceptable.push_back(@individuos.shift)
                    aux = @individuos.head
                elsif aux.value.imc >= 30.0 && aux.value.imc <= 34.9
                    obesidad1.push_back(@individuos.shift)
                    aux = @individuos.head
                elsif aux.value.imc >= 35.0 && aux.value.imc <= 39.9
                    obesidad2.push_back(@individuos.shift)
                    aux = @individuos.head
                else
                    obesidad3.push_back(@individuos.shift)
                    aux = @individuos.head
                end
            end
            expect(@individuos.empty?).to be(true)
            expect(bajo_peso.size).to be(1)
            expect(aceptable.size).to be(2)
            expect(obesidad1.size).to be(1)
            expect(obesidad2.size).to be(0)
            expect(obesidad3.size).to be(1)
        end
    end
end