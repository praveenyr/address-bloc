 require_relative 'entry'
 require "csv"
 
 class AddressBook
     attr_accessor :entries
     def initialize
         @entries = []
     end
     
     def add_entry(name,phone_number,email)
      index = 0
        entries.each do|entry|
          if name < entry.name
           break
          end
        index+=1
        end
       entries.insert(index,Entry.new(name,phone_number,email))
     end
     
     def import_from_csv(file_name)
       csv_text = File.read(file_name)
       csv = CSV.parse(csv_text,headers: true,skip_blanks: true) #Returns a CSV::Table Object
       
       csv.each do |row|
        row_hash = row.to_hash #Converts each row to a hash
        add_entry(row_hash["name"],row_hash["phone_number"],row_hash["email"])
       end
     end
     
     def binary_search(name)
        lower = 0
        upper = entries.length - 1
       
        while lower <= upper
         mid = (lower+upper) / 2
         
           if entries[mid].name == name
             return entries[mid]
           elsif entries[mid].name > name
               upper = mid - 1
           elsif entries[mid].name < name
              lower= mid + 1
           end
        end
        
        return nil
     end
     
   
 end