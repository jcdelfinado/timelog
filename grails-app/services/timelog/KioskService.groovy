package timelog

import grails.converters.JSON
import grails.transaction.Transactional
import grails.transaction.NotTransactional


class KioskService {
	
	@NotTransactional
	def listEmployees(){
		return Employee.list(params) as JSON
	}
	@NotTransactional
	def latestLog(){
		def employee = Employee.get(params.id)
		return ['lastLog':employee.lastLog, 'isLoggedIn':employee.isLoggedIn]
	}
}
