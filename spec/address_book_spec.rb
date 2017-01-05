require_relative '../models/address_book'

RSpec.describe AddressBook do

    describe "attributes" do
        it "responds to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        
        it "intializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        
        it "intializes entries as an empty array" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end
    
    describe "#add_entries" do
        it "adds entries to the entries array" do
           book = AddressBook.new
           book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
           expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
           book = AddressBook.new
           book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
           new_entry = book.entries[0]
           
           expect(new_entry.name).to eq('Ada Lovelace')
           expect(new_entry.phone_number).to eq('010.012.1815')
           expect(new_entry.email).to eq('augusta.king@lovelace.com')
       end
       
    end
    
    describe "#remove_entries" do
        it "removes entries in the entries array" do
           book = AddressBook.new
           book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
           expect(book.entries.size).to eq(1)
           book.add_entry('Praveen Y', '102.312.5124', 'praveen@arsenal.com')
           expect(book.entries.size).to eq(2)
           book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
           expect(book.entries.first.name).to eq('Praveen Y')
        end
    end

end