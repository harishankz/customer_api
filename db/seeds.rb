# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

p "Creating Roles"

customer_role = Role.find_or_create_by(role_name: "Customer", role_code: "Emp_CX")
manager_role = Role.find_or_create_by(role_name: "Manager", role_code: "Emp_MG")

p "Roles created"

p "User Creation"
manager_user = User.find_or_create_by(user_name: "manager_user_001",
                           email: "manager_user_001@gmail.com",
                           date_of_birth: "1992-10-02",
                           gender: "male",
                           phone_number: 9192093022,
                           role_id: manager_role.id)
manager_user.update( password: 123456)

customer_user = User.find_or_create_by(user_name: "customer_user_001",
                           email: "customer_user_001@gmail.com",
                           date_of_birth: "1992-10-02",
                           gender: "male",
                           phone_number: 9192093022,
                           role_id: customer_role.id)
customer_user.update( password: 123456)

p "User creation done..."
