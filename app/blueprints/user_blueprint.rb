class UserBlueprint < Blueprinter::Base
  identifier :id
  
  fields :name, :email, :password_digest
end