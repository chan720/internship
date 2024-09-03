ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at" ]
  end
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at" ]
  end
end
