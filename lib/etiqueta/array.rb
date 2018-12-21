class Array
  def sort_for
    aux = [self[0]]
    for i in (1..self.size)
      for j in (0..aux.size)
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