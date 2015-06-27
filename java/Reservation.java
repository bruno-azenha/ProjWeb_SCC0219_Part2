package Bridgeport;

public class Reservation implements java.io.Serializable {
	private User userObject;
	private Integer id;
	private String user;
	private String checkin;
	private String checkout;
	private Integer adult;
	private Integer baby;
	private Integer child;

	public Reservation() {
	}

	// Setters
	public void setid(int id){
		this.id = id;
	}
	public void setUser (String user) {
		this.user = user;
	}
	public void setUserObject(User user){
		this.userObject = user;
	}

	public void setCheckin (String checkin) {
		this.checkin = checkin;
	}

	public void setCheckout (String checkout) {
		this.checkout = checkout;
	}

	public void setAdult (Integer adult) {
		this.adult = adult;
	}

	public void setBaby (Integer baby) {
		this.baby = baby;
	}
	
	public void setChild (Integer child) {
		this.child = child;
	}

	// Getters
	public User getUserObject(){
		return this.userObject;
	}
	public String getUser () {
		return this.user;
	}

	public String getCheckin () {
		return this.checkin;
	}

	public String getCheckout () {
		return this.checkout;
	}

	public Integer getAdult () {
		return this.adult;
	}

	public Integer getBaby () {
		return this.baby;
	}

	public Integer getChild () {
		return this.child;
	}
	public Integer getId(){
		return this.id;
	}

}
