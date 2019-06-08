package com.poorna.calculator.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * This is our model class and it corresponds to Country table in database
 */
@Entity
@Table(name="Flowers")
public class Flowers{
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	
	/*@Column(name="countryName")
	String countryName;	*/
	
	/*@Column(name="population")
	long population;*/
	
	@Column(name="customername")
	private String customername;
	
	@Column(name="mobileno")
	private String mobileno;
	
	@Column(name="dateofpurchase")
	private String dateofpurchase;

	@Column(name="costofflowers")
	private double costofflowers;
	
	@Column(name="quantityofflowers")
	private int quantityofflowers;
	
	@Column(name="totalamountofflowers")
	private double totalamountofflowers;
	
	
	public String getDateofpurchase() {
		return dateofpurchase;
	}

	public void setDateofpurchase(String dateofpurchase) {
		this.dateofpurchase = dateofpurchase;
	}

	public double getCostofflowers() {
		return costofflowers;
	}

	public void setCostofflowers(double costofflowers) {
		this.costofflowers = costofflowers;
	}

	public int getQuantityofflowers() {
		return quantityofflowers;
	}

	public void setQuantityofflowers(int quantityofflowers) {
		this.quantityofflowers = quantityofflowers;
	}

	public double getTotalamountofflowers() {
		return totalamountofflowers;
	}

	public void setTotalamountofflowers(double totalamountofflowers) {
		this.totalamountofflowers = totalamountofflowers;
	}

	public Flowers() {
		super();
	}

	public int getId() {
		return id;
	}
	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public void setId(int id) {
		this.id = id;
	}
	/*public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public long getPopulation() {
		return population;
	}
	public void setPopulation(long population) {
		this.population = population;
	}*/	
	
}