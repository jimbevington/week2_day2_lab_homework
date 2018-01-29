require('minitest/autorun')
require('minitest/rg')

require_relative('../library')

class TestLibrary < MiniTest::Test

  def setup

    @catalogue = [
      {
        title: "lord of the rings",
        rental_details: {
          student_name: "jeff goldblum",
          due_date: "01/02/16"
        }
      },
      {
        title: "the book of dust: la belle sauvage",
        rental_details: {
          student_name: "gary barlow",
          due_date: "12/07/18"
        }
      },
      {
        title: "how to take over the world for dummies",
        rental_details: {
          student_name: "mark zuckerberg",
          due_date: "15/04/05"
        }
      }
    ]

    @library = Library.new(@catalogue)

    # for book details test
    @lotr = {
      title: "lord of the rings",
      rental_details: {
        student_name: "jeff goldblum",
        due_date: "01/02/16"
      }
    }

    # for change rental details test
    @jim_rent_book = {
      title: "lord of the rings",
      rental_details: {
        student_name: "jim bevington",
        due_date: "30/01/18"
      }
    }

  end

  def test_library
    assert_equal(@catalogue, @library.catalogue)
  end

  def test_book_details__present
    assert_equal(@lotr, @library.book_details("Lord of the Rings"))
  end
  #
  def test_book_details__not_present
    assert_equal("Not in catalogue.", @library.book_details("Harry Potter"))
  end

  def test_rental_details__present
    assert_equal(@lotr[:rental_details], @library.rental_details("Lord of the Rings"))
  end

  def test_rental_details__not_present
    assert_equal("Not in catalogue.", @library.rental_details("Some old book"))
  end

  def test_add_book__new_book
    @library.add_book("Rockin\' with Ruby")
    assert_equal(4, @library.catalogue.length)
  end

  def test_add_book__existing_book
    assert_equal("That book is already in the library.", @library.add_book("Lord of the Rings"))
    assert_equal(3, @library.catalogue.length)
    assert_equal(@lotr[:rental_details], @library.rental_details("Lord of the Rings"))
  end
  
  def test_new_rental
    @library.new_rental("Lord of the Rings", "Jim Bevington", "30/01/18")
    assert_equal(@jim_rent_book, @library.book_details("lord of the rings"))
  end

end
