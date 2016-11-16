class Tweet < ApplicationRecord
	belongs_to :bird
	validates :content, presence: true
end
