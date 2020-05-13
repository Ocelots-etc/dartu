class User < ActiveRecord::Base
    has_secure_password
    has_many :dart_cases
    has_many :dart_sets, :through => :dart_cases
    validates_uniqueness_of :username
  end