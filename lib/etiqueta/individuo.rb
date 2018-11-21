class Individuo
    attr_reader :nombre, :apellidos, :edad, :f_nacimiento, :genero, :ocupacion
    def initialize(nombre, apellidos, edad, f_nacimiento, genero, ocupacion)
        @nombre, @apellidos = nombre, apellidos
        @edad, @f_nacimiento = edad, f_nacimiento
        @genero = genero
        @ocupacion = ocupacion
    end
    def to_s
        "INDIVIDUO\n-Nombre: #{@nombre}\n-Apellidos: #{@apellidos}\n-Edad: #{@edad}\n-Fecha de nacimiento: #{@f_nacimiento}\n-Género: #{@genero}\n-Ocupación: #{@ocupacion}"
    end
end

class IndividuoPaciente < Individuo
    attr_reader :peso, :talla, :c_cintura, :c_cadera
    def initialize(nombre, apellidos, edad, f_nacimiento, genero, ocupacion, peso, talla, c_cintura, c_cadera, *opcional)
        super(nombre, apellidos, edad, f_nacimiento, genero, ocupacion)
        @peso = peso
        @talla = talla
        @c_cintura = c_cintura
        @c_cadera = c_cadera
    end
end
#individuo1 = Individuo.new('Juan Jesús', 'Padrón Hernández', 21, '22/08/1997','Hombre', 'Estudiante')
#puts individuo1
#peso, talla, c_cintura, c_cadera