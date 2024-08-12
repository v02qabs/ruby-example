class Sun
		def initialize(name)
			@name = name
		end
		
		def prints
			puts "#{@name}さん、いらっしゃい。"
		end
end

r = Sun.new("紘史")
r.prints

