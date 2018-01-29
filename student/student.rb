class Student

  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def get_student_name()
    return @name
  end

  def get_student_cohort()
    return @cohort
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_cohort(new_cohort)
    @cohort = new_cohort
  end

  def talk
    return "I can talk"
  end

  def fave_lang(language)
    return "I\'m mad about #{language}!"
  end

end
