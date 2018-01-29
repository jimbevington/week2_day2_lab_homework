require('minitest/autorun')
require('minitest/rg')

require_relative('../student.rb')

class TestStudent < MiniTest::Test

  def setup
    @student = Student.new('Jim', 'G4')
  end

  def test_student_name
    assert_equal('Jim', @student.get_student_name)
  end

  def test_student_name
    assert_equal('G4', @student.get_student_cohort)
  end

  def test_set_name()
    @student.set_name('Thomas')
    assert_equal('Thomas', @student.get_student_name)
  end

  def test_set_cohort()
    @student.set_cohort('G67')
    assert_equal('G67', @student.get_student_cohort)
  end

  def test_talk
    assert_equal('I can talk', @student.talk)
  end

  def test_favourite_language
    assert_equal("I\'m mad about Ruby!", @student.fave_lang('Ruby'))
  end


end
