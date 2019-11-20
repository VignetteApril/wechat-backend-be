# -*- encoding : utf-8 -*-
class Role < ApplicationRecord
  has_many :user_roles, dependent: :delete_all
  has_many :users, :through => :user_roles
  has_many :role_features, dependent: :delete_all
  has_many :features, through: :role_features

  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 50}

end
