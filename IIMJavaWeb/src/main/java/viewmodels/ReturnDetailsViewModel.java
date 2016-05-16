package viewmodels;

import domain.User;
import java.time.LocalDateTime;

public class ReturnDetailsViewModel {

    private User user;

    private LocalDateTime endDate, broughtBackDate;

    public ReturnDetailsViewModel(User user, LocalDateTime endDate, LocalDateTime broughtBackDate) {
        this.user = user;
        this.endDate = endDate;
        this.broughtBackDate = broughtBackDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public LocalDateTime getBroughtBackDate() {
        return broughtBackDate;
    }

    public void setBroughtBackDate(LocalDateTime broughtBackDate) {
        this.broughtBackDate = broughtBackDate;
    }
}
