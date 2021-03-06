package domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.sql.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

@Entity
public class Reservation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @NotNull
    private int id;

    private Date startDate, endDate, broughtBackDate, pickUpDate;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "reservation", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<ReservationDetail> reservationDetails;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<ReservationDetail> getReservationDetails() {
        return reservationDetails;
    }

    public void setReservationDetails(List<ReservationDetail> reservationDetails) {
        this.reservationDetails = reservationDetails;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getBroughtBackDate() {
        return broughtBackDate;
    }

    public void setBroughtBackDate(Date broughtBackDate) {
        this.broughtBackDate = broughtBackDate;
    }

    public Date getPickUpDate() {
        return pickUpDate;
    }

    public void setPickUpDate(Date pickUpDate) {
        this.pickUpDate = pickUpDate;
    }

    public LocalDate getLocalStartDate() {
        return startDate == null ? null : startDate.toLocalDate();
    }

    public LocalDate getLocalEndDate() {
        return endDate == null ? null : endDate.toLocalDate();
    }

    public LocalDate getLocalPickUpDate() {
        return pickUpDate == null ? null : pickUpDate.toLocalDate();
    }

    public LocalDate getLocalBroughtBackDate() {
        return broughtBackDate == null ? null : broughtBackDate.toLocalDate();
    }
}
