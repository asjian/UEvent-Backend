package net.eventhub.valueobject;

import java.math.BigDecimal;

public class LocationCoordinates {
	
	private BigDecimal longitude;
	private BigDecimal latitude;
	
	public BigDecimal getLongitude() {
		return longitude;
	}
	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}
	public BigDecimal getLatitude() {
		return latitude;
	}
	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}
}
