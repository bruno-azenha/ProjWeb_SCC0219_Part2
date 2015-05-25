package Bridgeport;
public class User implements java.io.Serializable {
    
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
    private Boolean isSuper = false;
    
    public User() {
    }
    
    // Setters
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
    
    public void setIsSuper (Boolean isSuper) {
        this.isSuper = isSuper;
    }
    

    // Getters
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
    
    public Boolean getIsSuper () {
        return this.isSuper;
    }
}