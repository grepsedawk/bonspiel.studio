abstract class BaseModel < Avram::Model
  def self.database : Avram::Database.class
    AppDatabase
  end

  def to_s(io : String::Builder)
    io << to_s
  end
end
