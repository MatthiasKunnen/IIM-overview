package viewmodels;

public class PickupDetailsViewModel {
    
    private String materialName;
    private int amount;

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public PickupDetailsViewModel() {
    }
    
    public PickupDetailsViewModel(String materialName, int amount) {
        this.materialName = materialName;
        this.amount = amount;
    }
}
