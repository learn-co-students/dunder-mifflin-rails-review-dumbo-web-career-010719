class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, :last_name, :title, :dog_id, :office, :img_url, :alias, presence: true
  validates :title, uniqueness: true
  validates :alias, uniqueness: true, unless: Proc.new { |a| a.none? }

  def none?
    self.alias == 'none'
  end

  def to_s
    self.first_name + " " + self.last_name
  end
end
