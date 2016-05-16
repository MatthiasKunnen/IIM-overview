package viewmodels;

import domain.User;
import java.util.Date;

public class ReturnDetailsViewModel {

    private User user;
    private int amount;
    private Date endDate, broughtBackDate;
    private boolean late;

    public ReturnDetailsViewModel(){
        
    }
    
    public ReturnDetailsViewModel(User user, int amount, Date endDate, Date broughtBackDate, boolean late) {
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

    public boolean isLate() {
        return late;
    }

    public void setLate(boolean late) {
        this.late = late;
    }

}
