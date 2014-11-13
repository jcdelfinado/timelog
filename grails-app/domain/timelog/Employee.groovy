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
		photo_url defaultValue: "'default-avatar.png'"
		pin matches: "/[0-9]{4}/" //four-digit pin
    }
}
