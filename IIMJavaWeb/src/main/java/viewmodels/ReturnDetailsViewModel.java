package viewmodels;

import domain.User;
import java.time.LocalDateTime;

public class ReturnDetailsViewModel {

    private User user;
    private int amount;
    private LocalDateTime endDate, broughtBackDate;
    private boolean late;

    public ReturnDetailsViewModel(){
        
    }
    
    public ReturnDetailsViewModel(User user, int amount, LocalDateTime endDate, LocalDateTime broughtBackDate, boolean late) {
        this.user = user;
        this.amount = amount;
        this.endDate = endDate;
        this.broughtBackDate = broughtBackDate;
        this.late = late; 
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

    public boolean isLate() {
        return late;
    }

    public void setLate(boolean late) {
        this.late = late;
    }

}
