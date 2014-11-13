package timelog

class Log {
	
	Date logTime
	boolean isLogIn
	
	static belongsTo = ['employee':Employee]
	
    static constraints = {
		isLogIn blank:false
    }
}
