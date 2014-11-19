package timelog

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.time.TimeDuration

class KioskController {

    def index() {
		render view:"index"
	}
	
	def log(){
		def employee = Employee.get(params.id)
		if (employee){
			if (params.pin == employee.pin){
				//println "match!"
				def newLog = new Log(
						employee : employee,	
						logTime : new Date(),
						isLogIn : (!employee.isIsLoggedIn())
					)
				newLog.save flush:true
				employee.lastLog = newLog.logTime
				employee.isLoggedIn = newLog.isLogIn
				employee.save flush:true
				render newLog as JSON
			} else render status:403
		} else render 'Something is wrong', status:500
	}
	
	def employees(){
		//println "We found the action"
		render (Employee.list(params) as JSON)
	}
	
	def last_log(Employee e){
		def employee = (e)?e:Employee.get(params.id);
		[logTime: employee.lastLog, isLogIn: employee.isLoggedIn]
	}
	
	def employee_logs(Employee employee){
		Log.where{
			employee == employee
		}.find()
	}
	
	def logs_today(Employee employee){
		def criteria = Log.createCriteria()
		criteria.list {
			eq 'employee', employee
			between 'logTime', new Date().clearTime(), new Date()
			order "logTime", "asc"
		}
	}
	
	def today(){
		//println "fn today"
		def employee = Employee.get(params.id)
		//println "id := " + params.id
		def lastLog = last_log(employee)
		def logsToday = logs_today(employee)
		def total = new TimeDuration(0,0,0,0)
		def prev
		for (current in logsToday){
			if (prev){
				
				if (current.isLogIn) prev = current
				else {
					//println "computing"
					use(groovy.time.TimeCategory){
						total += current.logTime - prev.logTime
					}
					//println total
				}
			} else prev = current;
		}
		def running
		use(groovy.time.TimeCategory){
			if (lastLog.isLogIn)
				running = (new Date() - lastLog.logTime) + total
			else running = total
		}
		//println running.hours + "h " + running.minutes
		if (running) render running.hours + " hour(s), " + running.minutes + " minute(s)"
		else render 'No logged time today yet.'
	}
}
