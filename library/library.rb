class Library

  attr_reader :catalogue

  def initialize(catalogue)
    @catalogue = catalogue
  end

  def book_details(book)
    book.downcase! # make downcase to match database
    for item in @catalogue
      if item[:title] == book
        return item
      else
        return "Not in catalogue." # Error message if not present
      end
    end
  end

  def rental_details(book)
    book.downcase! # make downcase to match database
    for item in @catalogue
      if item[:title] == book
        return item[:rental_details]
      else
        return "Not in catalogue." # Error message if not present
      end
    end
  end

  def add_book(book)
    book.downcase! # make downcase to match database
    # check if book is already in library
    for item in @catalogue
      if item[:title] == book
        # Error message if it already exists
        return "That book is already in the library."
      end
    end
    # if not
    # create the new book hash
    new_book = {
      name: book,
      rental_details: {
        student_name: "",
        due_date: ""
      }
    }
    # add it to catalogue array
    @catalogue.push(new_book)
  end

  def new_rental(book, student, due)
    book.downcase! # make downcase to match database
    student.downcase!
    for item in @catalogue
      if book == item[:title]
        item[:rental_details][:student_name] = student
        item[:rental_details][:due_date] = due
      end
    end
  end

end
