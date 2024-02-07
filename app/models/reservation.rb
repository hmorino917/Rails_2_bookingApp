class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guest_count, presence: true, numericality: {greater_than_or_equal_to: 1}

  validate :check_in_date_before_today
  validate :check_out_date_before_check_in_date

  private

  def check_in_date_before_today
    errors.add(:check_in,"は本日以前の日付で入力できません。") if check_in.present? && check_in < Date.today
  end

  def check_out_date_before_check_in_date
    errors.add(:check_out,"はチェックイン日より前の日付で入力できません。") if check_out.present? && check_in.present? && check_in >= check_out
  end

end
