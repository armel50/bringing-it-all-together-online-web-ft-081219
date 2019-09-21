class Dog
  attr_accessor :name, :breed 
  attr_reader :id
  def initialize(id: nil, name: name, breed: breed)
    @id = id 
    @name = name 
    @breed = breed
  end 
  
  
  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT, breed TEXT)")
  end
  
  def self.drop_table 
    DB[:conn].execute("DROP TABLE dogs")
  end
  
  def save 
    sql= <<-SQL
      INSERT INTO dogs(name,breed) 
      VALUES(?,?)
    SQL
    DB[:conn].execute(sql,self.name,self.breed) 
    @id = DB[:conn].execute("SELECT")
  end
end