class CharCounter
        
    def self.count(una_frase)

        @un_hash = Hash.new
        if una_frase!=nil
          el_string_separado = una_frase.gsub(/\s+/, "").split(//)
          el_string_separado.each do
            |letra|
              if @un_hash.has_key?(letra)
                @un_hash[letra] +=1
              else
                @un_hash[letra] = 1
              end
          end
        end
        @un_hash
    end

end