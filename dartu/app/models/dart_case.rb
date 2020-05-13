class DartCase < ActiveRecord::Base
    has_many :dart_sets
    belongs_to :user
    validates_presence_of :name, :user
  end
