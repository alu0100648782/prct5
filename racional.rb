#implementar en este fichero la clase para crear los objetos

require "./gcd.rb"

class Fraccion
	attr_accessor :n, :d
	
	def initialize(n,d)
      raise RuntimeError unless n.is_a? Integer and d.is_a? Integer
		@n, @d = n, d
	end

   def to_s
      "#{@n}/#{@d}"
   end

   def reducir(n,d)
   	mcd = gcd(n,d)
   	Fraccion.new(n/mcd, d/mcd)
   end

   def sumayresta(other,f1,f2)
   	if f1.d != f2.d then
   		mcm = (f1.d * f2.d) / gcd(f1.d,f2.d)
   		f1.n = mcm / f1.d * f1.n
   		f1.d = mcm
   		f2.n = mcm / f2.d * f2.n
   		f2.d = mcm
   	end
   end
   
   def +(other)
   	f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
   	sumayresta(other,f1,f2)
   	ff = Fraccion.new(f1.n + f2.n, f1.d)
   	reducir(ff.n,ff.d)
   end

   def -(other)
   	f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
   	sumayresta(other,f1,f2)
   	ff = Fraccion.new(f1.n - f2.n, f1.d)
   	reducir(ff.n,ff.d)
   end
   
   def *(other)
      f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
      ff = Fraccion.new(f1.n * f2.n, f1.d * f2.d)
      reducir(ff.n,ff.d)
   end

   def division(other)
   	f1 = reducir(@n,@d)
   	f2 = reducir(other.n, other.d)
      ff = Fraccion.new(f1.n * f2.d, f1.d * f2.n)
      reducir(ff.n,ff.d)
   end

   def ==(other)
   	return @n == other.n && @d  == other.d if other.instance_of? Fraccion
   	false
   end
end
