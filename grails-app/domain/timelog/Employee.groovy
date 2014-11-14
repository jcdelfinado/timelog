package timelog

class Employee {

	String firstName
	String middleName
	String lastName
	String position
	String pin
	String photo_url
	byte [] photo
	Date lastLog
	boolean isLoggedIn
	boolean isAdmin
	
	static transients = ['photo'] 
    static constraints = {
		isLoggedIn defaultValue: "0"
		isAdmin defaultValue: "0"
		lastLog nullable:true
		photo nullable:true
		photo_url nullable:true
		pin matches: "[0-9]{4}", unique: true //unique four-digit pin
    }
	static mappings = {
		photo_url defaultValue: "images/default-avatar.png"
	}
	
	def fullName() {return firstName + " " + middleName[0].toUpperCase() + ". " + lastName} 
}
