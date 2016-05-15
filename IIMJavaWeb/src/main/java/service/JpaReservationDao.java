package service;

import domain.Reservation;

public class JpaReservationDao extends GenericDaoJpa<Reservation> implements ReservationDao
{
    public JpaReservationDao() {
        super(Reservation.class);
    }

    @Override
    public Reservation getReservationWithPickupDateToday() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
