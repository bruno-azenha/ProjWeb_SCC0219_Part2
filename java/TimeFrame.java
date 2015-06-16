package Bridgeport;

public class TimeFrame implements java.io.Serializable {

	private String startDate
	private String endDate;

	public TimeFrate (){
	}

	// Setters
	public void setStartDate (String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate (String endDate) {
		this.endDate = endDate;
	}

	// Getters
	public Integer getStartDate () {
		return this.startDate;
	}

	public Integer getEndDate () {
		return this.endDate;
	}

}
