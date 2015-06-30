package Bridgeport;

public class TimeFrame implements java.io.Serializable {

	private String startDate;
	private String endDate;
	private Integer id;

	public TimeFrame (){
	}

	// Setters
	public void setStartDate (String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate (String endDate) {
		this.endDate = endDate;
	}

	public void setId (Integer id){
		this.id = id;
	}

	// Getters
	public String getStartDate () {
		return this.startDate;
	}

	public String getEndDate () {
		return this.endDate;
	}

	public Integer getId (){
		return this.id;
	}

}
