package timelog

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.time.TimeDuration

class KioskController {

    def index() {
		render view:"index"
	}
	
	def employees(){
		println "We found the action"
		render ([employees:Employee.list(params)] as JSON)
	}
	
	def last_log(){
		def employee = Employee.get(params.id)
		[lastLog: employee.lastLog, isLoggedIn: employee.isLoggedIn]
	}
	
	def employee_logs(Employee employee){
		Log.where{
			employee == employee
		}.find()
	}
	
	def logs_today(Employee employee){
		def criteria = Log.createCriteria()
		criteria.scroll {
			eq employee: employee
			between new Date().clearTime(), new Date()
			order "logTime", "asc"
		}
	}
	
	def today(){
		def employee = Employee.get(params.id)
		def lastLog = last_log()
		def logsToday = logs_today(employee)
		def total = new TimeDuration()
		while (logsToday.next()){
			def current = logsToday.get() 
			if (current.isLogIn) prev = current
			else {
				def diff = current.logTime - prev.logTime
				total += diff
			}
		}
		total
	}
}
