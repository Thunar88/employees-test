5.times do
  Department.create(name: FFaker::Company.position)
end

50.times do
  Employee.create(name: FFaker::Name.first_name,
                  active: FFaker::Boolean.random,
                  department_id: Department.ids.sample)
end
