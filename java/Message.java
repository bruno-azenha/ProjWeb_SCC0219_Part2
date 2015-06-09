package Bridgeport;
public class Message implements java.io.Serializable {

	private String name;
	private String email;
	private String mobile;
	private String known;
	private String message;

	public Message() {
	}

	// Setters
	public void setName (String name) {
		this.name = name;
	}

	public void setEmail (String email) {
		this.email = email;
	}

	public void setMobile (String mobile) {
		this.mobile = mobile;
	}

	public void setKnown (String known) {
		this.known = known;
	}

	public void setMessage (String message) {
		this.message = message;
	}


	// Getters
	public String getName () {
		return this.name;
	}

	public String getEmail () {
		return this.email;
	}

	public String getMobile () {
		return this.mobile;
	}

	public String getMessage () {
		return this.message;
	}

	public String getKnown () {
		return this.known;
	}
}
