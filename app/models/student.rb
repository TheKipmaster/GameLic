class Student < User
  belongs_to :narrative, optional: true
end