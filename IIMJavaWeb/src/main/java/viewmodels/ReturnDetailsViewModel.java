package viewmodels;

import domain.User;
import java.time.LocalDate;

public class ReturnDetailsViewModel {

    private User user;
    private int amount;
    private LocalDate endDate, broughtBackDate;
    private boolean late;

    public ReturnDetailsViewModel() {

    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public LocalDate getBroughtBackDate() {
        return broughtBackDate;
    }

    public void setBroughtBackDate(LocalDate broughtBackDate) {
        this.broughtBackDate = broughtBackDate;
    }

    public boolean isLate() {
        return late;
    }

    public void setLate(boolean late) {
        this.late = late;
    }
}
