class Booking < ActiveRecord::Base
  belongs_to :user

  attr_accessor :current_user

  validates_presence_of :date, :hour
  validate :ownership, on: [:update]

  private

  def ownership
    errors.add(:user, 'Não poder alterar a reserva de outro usuário') if user != current_user
  end

  scope :in_range, ->(x) { where('day BETWEEN ? AND ?', x, x + 7.day) }

end
