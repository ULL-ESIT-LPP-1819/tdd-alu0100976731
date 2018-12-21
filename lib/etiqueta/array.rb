class Array
  def valor_energetico_for
    aux = 0
    for i in (0..self.size-1)
      aux+=self[i].valor_energetico
    end
    aux
  end
  def sort_for
    aux = [self[0]]
    for i in (1..self.size-1)
			for j in (0..aux.size)
				if aux.size == j
          aux.push(self[i])
        elsif self[i].valor_energetico_for <= aux[j].valor_energetico_for
          aux.insert(j,self[i])
          break
        end
      end
    end
		# Lista.new().insert_array(aux)
		aux
	end

  def valor_energetico_each
    self.collect{|x| x.valor_energetico}.reduce(:+)
  end

	def sort_each
		aux = []
		i = 0
		self.each do |x|
			if i!=0
				j = 0
				aux.each do |y|
					if j == aux.size-1
						if x.valor_energetico_each <= y.valor_energetico_each
							aux.insert(j,x)
							break
						else
							aux.push(x)
							break
						end
					elsif x.valor_energetico_each <= y.valor_energetico_each
						aux.insert(j,x)
						break
					end
					j+=1
				end
			else
				aux.push(x)
			end
			i+=1
		end 
		# Lista.new().insert_array(aux)
		aux
	end
end