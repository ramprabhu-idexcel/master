class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :age, :address, :phone, :created_at, :updated_at

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end

  def updated_at
    object.updated_at.strftime("%d/%m/%Y")
  end
end
