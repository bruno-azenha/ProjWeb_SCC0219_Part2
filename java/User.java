package Bridgeport;
import java.util.ArrayList;
public class User implements java.io.Serializable {

	private Integer id;
	private String name;
	private String cpf;
	private String dob;
	private String gender;
	private String civilStatus;
	private String city;
	private String state;
	private String zip;
	private String email;
	private String password;
	private String regDate;
	private Boolean isSuper = false;
	private ArrayList<Reservation> reservationList;

	public User() {
	}

	// Setters
	public void setId(Integer id){
		this.id = id;
	}
	public void setReservationList( ArrayList <Reservation> reservationList){
		this.reservationList = reservationList;
	}
	public void setName (String name) {
		this.name = name;
	}

	 public void setCpf (String cpf) {
		this.cpf = cpf;
	}

	public void setDob (String dob) {
		this.dob = dob;
	}

	public void setGender (String gender) {
		this.gender = gender;
	}

	public void setCivilStatus (String civilStatus) {
		this.civilStatus = civilStatus;
	}

	public void setCity (String city) {
		this.city = city;
	}

	public void setState (String state) {
		this.state = state;
	}

	public void setZip (String zip) {
		this.zip = zip;
	}

	public void setEmail (String email) {
		this.email = email;
	}

	public void setPassword (String password) {
		this.password = password;
	}

	public void setRegDate (String regDate) {
		this.regDate = regDate;
	}

	public void setIsSuper (Boolean isSuper) {
		this.isSuper = isSuper;
	}


	// Getters

	public Integer getId(){
		return this.id;
	}
	public ArrayList <Reservation> getReservationList(){
		return this.reservationList;
	}
	public String getName () {
		return this.name;
	}

	public String getCpf () {
		return this.cpf;
	}

	public String getDob () {
		return this.dob;
	}

	public String getGender () {
		return this.gender;
	}

	public String getCivilStatus () {
		return this.civilStatus;
	}

	public String getCity () {
		return this.city;
	}

	public String getState() {
		return this.state;
	}

	public String getZip() {
		return this.zip;
	}
	
	public String getEmail () {
		return this.email;
	}
	
	public String getPassword () {
		return this.password;
	}
	
	public String getRegDate() {
		return this.regDate;
	}

	public Boolean getIsSuper () {
		return this.isSuper;
	}
}