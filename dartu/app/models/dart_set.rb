class DartSet < ActiveRecord::Base
    belongs_to :dart_case
    validates_presence_of :name, :dart_case
end