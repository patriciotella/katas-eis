class CharCounter
        
    def self.count(un_string)

        @un_hash = Hash.new
        if un_string!=nil
          el_string_separado = un_string.gsub(/\s+/, "").split(//)
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