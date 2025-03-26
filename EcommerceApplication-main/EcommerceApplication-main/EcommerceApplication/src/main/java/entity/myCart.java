package entity;

public class myCart {
    private int userId;
    private String name;
    private int productId; 
    private String productName;
    private String productDescroption;
    private double productPrice;
    private String sold;


  
    public myCart(int userId, int productId) {
        this.userId = userId;
        this.productId = productId;
    }

    
    public myCart(int userId, String name, int productId, String productName, String productDescroption,
			double productPrice, String sold) {
		super();
		this.userId = userId;
		this.name = name;
		this.productId = productId;
		this.productName = productName;
		this.productDescroption = productDescroption;
		this.productPrice = productPrice;
		this.sold = sold;
	}


	public myCart() {
		
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductDescroption() {
		return productDescroption;
	}


	public void setProductDescroption(String productDescroption) {
		this.productDescroption = productDescroption;
	}


	public double getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}


	public String getSold() {
		return sold;
	}


	public void setSold(String sold) {
		this.sold = sold;
	}


	@Override
	public String toString() {
		return "myCart [userId=" + userId + ", name=" + name + ", productId=" + productId + ", productName="
				+ productName + ", productDescroption=" + productDescroption + ", productPrice=" + productPrice
				+ ", sold=" + sold + "]";
	}


    
	

   
}

