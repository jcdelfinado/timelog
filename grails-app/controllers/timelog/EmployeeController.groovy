package timelog

class EmployeeController {

    def index() {
		render view:"index", model:[employeeList:Employee.list()]
	}
	
	def create(){
		println "we're creating again"
		def employee = new Employee(params)
		
		respond employee, view:"create"
	}
	
	def save(Employee employee){
		println "WE ACTUALLY GOT HERE"
		if (employee){
			println employee.firstName
			println employee.errors
			if (employee.hasErrors()){
				println "but we got errors"
				println employee.errors
				render model:[employee:employee], view:"create"
			}
		}
	}
}
