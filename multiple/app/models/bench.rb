class Bench < ActiveRecord::Base
  belongs_to :script
  attr_accessible :result, :script_id, :stdout
end
