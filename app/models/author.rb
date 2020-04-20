class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "Las contraseñas deben ser iguales", if: :password
end
