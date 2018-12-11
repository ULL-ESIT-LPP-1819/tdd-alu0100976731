# La clase Individuo representa la información de una persona.
#
# @author Juan Jesús Padrón Hernández  (mailto:alu0100976731@ull.edu.es)
class Individuo
    attr_reader :nombre, :apellidos, :edad, :f_nacimiento, :genero, :ocupacion

    # Inicializa el objeto con los parámetros indicados.
    # @param nombre [String] Nombre de la persona.
    # @param apellidos [String] Sus apellidos.
    # @param edad [Numeric] Su edad.
    # @param f_nacimiento [String] Su fecha de nacimiento.
    # @param genero [String] Su género.
    # @param ocupacion [String] A qué se dedica la persona.
    def initialize(nombre, apellidos, edad, f_nacimiento, genero, ocupacion)
        @nombre, @apellidos = nombre, apellidos
        @edad, @f_nacimiento = edad, f_nacimiento
        @genero = genero
        @ocupacion = ocupacion
    end

    # Devuelve la cadena con la que se representará a la persona.
    # @return [String] Cadena con los datos del objeto de la clase Individuo.
    def to_s
        "INDIVIDUO\n-Nombre: #{@nombre}\n-Apellidos: #{@apellidos}\n-Edad: #{@edad}\n-Fecha de nacimiento: #{@f_nacimiento}\n-Género: #{@genero}\n-Ocupación: #{@ocupacion}"
    end
end

# Clase que representa los datos de una persona con su valoración nutricional.
# Representa a un paciente que está siendo tratado, y por tanto, se tienen sus medidas antropométricas.
# Es hija de la clase _Individuo_.
# Se ha hecho _Comparable_.
#
# @author Juan Jesús Padrón Hernández  (mailto:alu0100976731@ull.edu.es)
class IndividuoPaciente < Individuo
    include Comparable
    attr_reader :n_historia, :peso, :talla, :c_cintura, :c_cadera

    # Inicializa el objeto con los parámetros indicados.
    # @param nombre [String] Nombre de la persona.
    # @param apellidos [String] Sus apellidos.
    # @param edad [Numeric] Su edad.
    # @param f_nacimiento [String] Su fecha de nacimiento.
    # @param genero [String] Su género.
    # @param ocupacion [String] A qué se dedica la persona.
    # @param n_historia [Numeric] Identificador de la historia médica.
    # @param peso [Numeric] Peso de la persona.
    # @param talla [Numeric] Su altura.
    # @param c_cintura [Numeric] Circunferencia de su cintura.
    # @param c_cadena [Numeric] Circunferencia de su cadera.
    def initialize(nombre, apellidos, edad, f_nacimiento, genero, ocupacion, n_historia, peso, talla, c_cintura, c_cadera, *opcional)
        super(nombre, apellidos, edad, f_nacimiento, genero, ocupacion)
        @n_historia = n_historia
        @peso = peso
        @talla = talla
        @c_cintura = c_cintura
        @c_cadera = c_cadera
    end

    # Calcula el Índice de Masa Corporal del paciente.
    # @return [Numeric] IMC de la persona.
    def imc
        (@peso/@talla**2).round(2)
    end

    # Calcula el porcentaje de grasa corporal del paciente.
    # @return [Numeric] Porcentaje de grasa corporal de la persona.
    def p_grasa
        if @genero == 'Hombre'
            (1.2*imc+0.23*@edad-10.8*1-5.4).round(2)
        else
            (1.2*imc+0.23*@edad-5.4).round(2)
        end
    end

    # Calcula la Relación Cintura Cadera del paciente.
    # @return [Numeric] RCC de la persona.
    def rcc
        (c_cintura.to_f/c_cadera).round(2)
    end

    # Representa la información del objeto IndividuoPaciente.
    # @return [String] Cadena con la representación de la información personal y medidas antropométricas.
    def to_s
        super + "\n-Nº Historia: #{@n_historia}\n-Peso: #{@peso}\n-Talla: #{@talla}\n-Circ. Cintura: #{@c_cintura}\n-Circ. Cadera: #{@c_cadera}\n-IMC: #{imc}\n-RCC: #{rcc}"
    end

    # Define la clase como Comparable. Compara los alimentos por su IMC.
    def <=>(other)
        imc <=> other.imc
    end

    # Calcula el peso teorico ideal del individuo en kg.
    # @return [Numeric] Peso teorico ideal (kg).
    def peso_teorico_ideal
        ((@talla*100-150)*0.75+50).round(2)
    end

    # Calcula el gasto energético basal en kcal. Este depende del género del individuo.
    # @return [Numeric] Gasto energético basal (kcal).
    def gasto_energetico_basal
        comun = (10*@peso)+(6.25*@talla*100)-(5*@edad)
        if genero == "Mujer"
            comun-161
        else # genero == "Hombre"
            comun+5
        end
    end

    # Calcula el gasto energético en kcal que se necesita para procesar los alimentos.
    # @return [Numeric] Gasto enérgético por efecto termógeno (kcal).
    def efecto_termogeno
        (gasto_energetico_basal*0.1).round(3)
    end

    def gasto_actividad_fisica
    end
end
