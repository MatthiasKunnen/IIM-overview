package service;

import domain.Reservation;

public interface ReservationDao extends GenericDao<Reservation> {

    public Reservation getReservationWithPickupDateToday();
}
