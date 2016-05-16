package service;

import domain.Reservation;

public class JpaReservationDao extends GenericDaoJpa<Reservation> implements ReservationDao
{
    public JpaReservationDao() {
        super(Reservation.class);
    }
}
