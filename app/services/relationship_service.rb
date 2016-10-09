class RelationshipService
  MAX_NUM_OF_TEACHERS = 3

  def initialize(teacher, student)
    @teacher, @student = teacher, student
  end

  def create
    if @teacher.blank? || @student.teachers.include?(@teacher)
      return { error: "Error" }
    end

    if @student.teachers.size >= MAX_NUM_OF_TEACHERS
      return { error: "最多只能添加#{MAX_NUM_OF_TEACHERS}个老师。" }
    end

    begin
      @student.teachers << @teacher
    rescue Exception => e
      return { error: "Error." }
    end

    { success: true }
  end

  def destroy
    if @teacher.blank? || !@student.teachers.include?(@teacher)
      return { error: "Error" }
    end

    begin
      @student.teachers.delete(@teacher)
    rescue Exception => e
      return { error: "Error." }
    end

    { success: true }
  end
end
