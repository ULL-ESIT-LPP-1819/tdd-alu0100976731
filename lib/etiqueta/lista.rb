require 'terminal-table'

# _Node_ es una clase que representa a un nodo con tres parámetros.
# *value* representa el valor del nodo.
# *next* el nodo siguiente.
# *prev* el nodo anterior.
Node = Struct.new(:value, :next, :prev)

# La clase Lista impementa una lista doblemente enlazada DLL,
# la cual contiene una serie de nodos con punteros al siguiente
# y al anterior, para poder recorrerla en ambos sentidos.
# Se ha hecho Enumberable.
#
# @author Juan Jesús Padrón Hernández  (mailto:alu0100976731@ull.edu.es)
class Lista
	include Enumerable
	# Primer elemento de la lista.
	attr_reader :head
	# Último elemento de la lista.
	attr_reader :tail

	# Inicializa la lista con head y tail nulos.
	def initialize
		@head = nil
		@tail = nil
	end

	# Comprueba si la lista está vacía.
	# @return [bool] *true* si la lista está vacía, *false* si contiene algún elemento
	def empty?
		if @head == nil
			return true
		else
			return false
		end
	end

	# Inserta nodo por delante.
	# @param nodo [Node] Elemento que queremos insertar en la lista.
	def push_front(nodo)
		if @head == nil
			@head = Node.new(nodo,nil,nil)
			@tail = @head
		else
			aux = @head
			@head = Node.new(nodo, aux, nil)
			aux.prev = @head
		end
	end

	# Elimina nodo por delante devolviendo su valor.
	# Si la lista está vacía lanza una excepción _RuntimeError_.
	# @return [Object] El valor que se ha eliminado de la lista.
	def shift
		if @head == nil
			raise RuntimeError, "No se puede extraer porque la lista está vacía."
		else
			aux = @head.value
			if @head == @tail
				aux 
				@head = nil
				@tail = nil
			else
				aux = @head.value
				@head = @head.next
				@head.prev = nil
			end
				return aux
		end
	end

	# Inserta nodo por detrás
	# @param (see #push_front)
	def push_back(nodo)
		if @head == nil
			@head = Node.new(nodo,nil,nil)
			@tail = @head
		else
			aux = @tail
			@tail = Node.new(nodo,nil,aux)
			aux.next = @tail
		end
	end

	# Elimina nodo por detrás devolviendo su valor
	# @return (see #shift)
	def pop
		if @head == nil
			raise RuntimeError, "No se puede extraer porque la lista está vacía."
		else
			aux = @tail.value
			if @head == @tail
				@head = nil
				@tail = nil
			else
				aux = @tail.value
				@tail = @tail.prev
				@tail.next = nil
			end
			return aux
		end
	end

	# Devuelve el tamaño de las lista.
	# @return [Numeric] Cantidad de nodos en la lista.
	def size
		cont = 0
		aux = @head
		while aux != nil
			cont+=1
			aux = aux.next
		end
		cont
	end

	# Devuelve el nodo de la posición dada.
	# @param pos [Numeric] Posición del nodo que queremos obtener.
	# @return [Object] Valor del nodo de la posición _pos_.
	def get(pos)
		if pos>=size
			raise RuntimeError, "La posición introducida es mayor que el tamaño de la lista"
		else
			i = 0
			aux = @head
			while i != pos
				aux = aux.next
				i+=1
			end
			aux.value
		end
	end

	# Inserta el nodo en la posición dada
	# @param pos [Numeric] Posición en la que queremos insertar el nodo.
	# @param nodo [Object] Elemento que queremos insertar.
	def insert(pos, nodo)
		case pos
		when 0
			push_front(nodo)
		when size
			push_back(nodo)
		when 1..size-1
			i = 0
			aux = @head
			while i!=pos
				aux = aux.next
				i+=1
			end
			nuevo = Node.new(nodo,aux,aux.prev)
			aux.prev.next = nuevo
			aux.prev = nuevo
		else
			raise RuntimeError, "La posición introducida es mayor que el tamaño de la lista"
		end
	end

	# Elimina el nodo en la posición dada.
	# @param pos [Numeric] Posición del nodo que queremos eliminar.
	def erase(pos)
		case pos
		when 0
			shift
		when size-1
			pop
		when 1..size-2
			i = 0
			aux = @head
			while i != pos
				aux = aux.next
				i+=1
			end
			aux.prev.next = aux.next
			aux.next.prev = aux.prev
		else
			raise RuntimeError, "La posición introducida es mayor que el tamaño de la lista"
		end
	end

	# Devuelve una cadena de la forma: value1 <-> value2 <-> value3
	# @return [String] Cadena que representa la lista.
	def to_s
		i = @head
		cadena = ""
		while i!=nil && i!=@tail do
			cadena += "#{i.value} <-> "
			i = i.next
		end
		cadena += "#{i.value}"
		cadena
	end

	# Devuelve el nodo de la posición dada.
	# @param index [Numeric] Posición del nodo que queremos obtener.
	# @return [Object] Valor del nodo de la posición _index_.
	def [](index)
		if index>=size
			raise RuntimeError, "La posición introducida es mayor que el tamaño de la lista"
		else
			i = 0
			aux = @head
			while i != index
				aux = aux.next
				i+=1
			end
			aux.value
		end
	end

	# Define la clase como Enumerable. Recorre la lista devolviendo cada nodo.
	def each
		aux = @head
		while aux != nil
			yield aux.value
			aux = aux.next
		end
	end

	def insert_array(elementos)
		for i in (0..elementos.size-1)
			self.push_back(elementos[i])
			p elementos[i]
		end
	end

	def sort_for
    aux = [self[0]]
    for i in (1..self.size-1)
      for j in (0..aux.size-1)
        if self[i] <= aux[j]
          aux.insert(j,self[i])
          break
        end
        if aux.size == j
          aux.push(self[i])
        end
      end
    end
    aux
	end
end