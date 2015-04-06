class CharCounter

    def initialize ()
        @un_hash = Hash.new(0) 
    end
        
    def count(un_string)
        un_string.split("")
        un_string.each do
            |letra| un_hash[letra] +=1
        end
        return un_hash
    end

end