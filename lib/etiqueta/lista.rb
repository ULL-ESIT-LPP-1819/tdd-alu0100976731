Node = Struct.new(:value, :next, :prev)

class Lista
	attr_reader :head, :tail
	def initialize
		@head = nil
		@tail = nil
	end

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

	def size
		cont = 0
		aux = @head
		while aux != nil
			cont+=1
			aux = aux.next
		end
		cont
	end

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

	def erase(pos)
		if pos == 0
			shift
		elsif pos == size-1
			pop
		else
			i = 0
			aux = @head
			while i != pos
				aux = aux.next
				i+=1
			end
			aux.prev.next = aux.next
			aux.next.prev = aux.prev
		end
	end

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
end