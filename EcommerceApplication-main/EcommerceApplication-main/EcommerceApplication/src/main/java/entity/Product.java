package entity;

public class Product {
private int productId;
private String productName;
private String productDescroption;
private double productPrice;
private String sold;




public Product(int productId, String productName, String productDescroption, double productPrice, String status) {
	super();
	this.productId = productId;
	this.productName = productName;
	this.productDescroption = productDescroption;
	this.productPrice = productPrice;
	this.sold = status;
}

public Product() {
	
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

public String getProductDescription() {
	return productDescroption;
}

public void setProductDescription(String productDescroption) {
	this.productDescroption = productDescroption;
}

public double getProductPrice() {
	return productPrice;
}

public void setProductPrice(double productPrice) {
	this.productPrice = productPrice;
}

public String isSold() {
	return sold;
}

public void setSold(String sold) {
	this.sold = sold;
}

@Override
public String toString() {
	return "Product [productId=" + productId + ", productName=" + productName + ", productDescroption="
			+ productDescroption + ", productPrice=" + productPrice + ", sold=" + sold + "]";
}
 
}
