require 'test_helper'
require_relative '../../../lib/stackoverflow/47376929/reservation'

class ReservationTest < Minitest::Test

  def setup
    @name = 'test reservation'
    @date_start = 1.days.from_now.to_date
    @date_end = 3.days.from_now.to_date
    @reservation = Reservation.create(name: @name, date_start: @date_start, date_end: @date_end)

    @date_start2 = 6.days.from_now.to_date
    @date_end2 = 7.days.from_now.to_date
    @reservation2 = Reservation.create(name: @name, date_start: @date_start2, date_end: @date_end2)
  end

  def down
    Reservation.delete_all
  end

  def test_reservation_exists
    assert @reservation.present?
  end

  def test_date_start_overlapped
    target_date = 2.days.from_now.to_date

    target_reservation = Reservation.new(name: 'target reservation', date_start: Date.today, date_end: target_date)
    assert !target_reservation.exclusive_reservation?
  end

  def test_date_end_overlapped
    target_date = 2.days.ago.to_date
    target_reservation = Reservation.new(name: 'target reservation', date_start: target_date, date_end: @date_end)
    assert !target_reservation.exclusive_reservation?
  end

  def test_date_start_and_date_end_overlapped
    target_reservation = Reservation.new(name: 'target reservation', date_start: @date_start, date_end: @date_end)
    assert !target_reservation.exclusive_reservation?
  end

  def test_date_not_past_overlapped
    date_start = 4.days.from_now.to_date
    date_end = 5.days.from_now.to_date
    target_reservation = Reservation.new(name: 'target reservation', date_start: date_start, date_end: date_end)
    assert target_reservation.exclusive_reservation?
  end

  def test_date_not_future_overlapped
    date_start = Date.today
    date_end = Date.today
    target_reservation = Reservation.new(name: 'target reservation', date_start: date_start, date_end: date_end)
    assert target_reservation.exclusive_reservation?
  end
end
