package timelog

import grails.converters.*

class EmployeeController {

    def index() {
		render view:"index", model:[employeeList:Employee.list()]
	}
	
	def show(Employee employee) {
		respond employee
	}
	
	def create(){
		println "we're creating again"
		def employee = new Employee(params)
		
		respond employee, view:"create"
	}
	
	def save(EmployeeHandler employee){
		println "WE ACTUALLY GOT HERE"
		if (employee){		
			if (employee.hasErrors()){
				flash.message = "<b>Oops!</b> Looks like there's something wrong with this form."
				flash.context= "danger"
				println employee.errors
				render model:[employee:employee], view:"create"
			}
			if (employee.save(flush:true)){
				def avatar = request.getFile('photo')
				if (!avatar.isEmpty()){
					employee.photo_url = fileUploadService.upload(avatar, "${employee.id}", "images/avatars")
				} else employee.photo_url = "default-avatar.png"
				redirect action:"show", id:employee.id
			}
		}
	}
}

class EmployeeHandler{
	String firstName, middleName, lastName, position, pin
	boolean isAdmin
	byte [] photo
	Date lastLog = new Date()
	
	static transients = ['photo']
	static constraints = {
		firstName blank:false
		middleName blank:false
		lastName blank:false
		position blank:false
		pin blank:false, matches:"[0-9]{4}"
	}
	static mappings = {
		photo_url defaultValue: "default-avatar.png"
		isLoggedIn defaultValue: false
	}
}