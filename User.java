package Bridgepoint;
public class User implements java.io.Serializable {
    private String name;
    private String email;
    private String password;
    private Boolean isSuper;
    
    public User() {
    }
    
    public void setName (String name) {
        this.name = name;
    }
    
    public void setEmail (String email) {
        this.email = email;
    }
    
    public void setPassword (String password) {
        this.password = password;
    }
    
    public void setIsSuper(Boolean isSuper) {
        this.isSuper = isSuper;
    }
    
    public String getName (){
        return this.name;
    }
    
    public String getEmail (){
        return this.email;
    }
    
    public String getPassword (){
        return this.password;
    }
    
    public Boolean getIsSuper (){
        return this.isSuper;
    }
}