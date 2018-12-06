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
    attr_reader :n_historia, :peso, :talla, :c_cintura, :c_cadera
    def initialize(nombre, apellidos, edad, f_nacimiento, genero, ocupacion, n_historia, peso, talla, c_cintura, c_cadera, *opcional)
        super(nombre, apellidos, edad, f_nacimiento, genero, ocupacion)
        @n_historia = n_historia
        @peso = peso
        @talla = talla
        @c_cintura = c_cintura
        @c_cadera = c_cadera
    end
    def imc
        (@peso/@talla**2).round(2)
    end
    def p_grasa
        if @genero == 'Hombre'
            (1.2*imc+0.23*@edad-10.8*1-5.4).round(2)
        else
            (1.2*imc+0.23*@edad-5.4).round(2)
        end
    end
    def rcc
        (c_cintura.to_f/c_cadera).round(2)
    end
    def to_s
        super + "\n-Nº Historia: #{@n_historia}\n-Peso: #{@peso}\n-Talla: #{@talla}\n-Circ. Cintura: #{@c_cintura}\n-Circ. Cadera: #{@c_cadera}\n-IMC: #{imc}\n-RCC: #{rcc}"
    end
        

end
