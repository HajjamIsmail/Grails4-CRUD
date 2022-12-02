package org.mbds.emsi

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserController{

    UserService userService

    def data_for_datatable() {
        int draw = params.int("draw")
        int length = params.int("length")
        int start = params.int("start")
        String dataTableOrderColumnIdx = params["order[0][column]"]
        String dataTableOrderColumnName = "columns[" + dataTableOrderColumnIdx + "][data]"
        String sortName = params[dataTableOrderColumnName] ?: "id"
        String sortDir = params["order[0][dir]"] ?: "asc"
        String queryString = params["search[value]"]
        PagedResultList criteriaResult = User.createCriteria().list([max: length, offset:start]) {
            readOnly true
            or {
                ilike('id', '%' +  queryString + '%')
                ilike('firstName', '%' + queryString + '%')
                ilike('lastName', '%' + queryString + '%')
                ilike('emailAddress', '%' + queryString + '%')
                ilike('phoneNumber', '%' + queryString + '%')
                ilike('password', '%' + queryString + '%')
            }
            order sortName, sortDir
        }
        Map dataTableResults = [
                draw: draw,
                recordsTotal: criteriaResult.totalCount,
                recordsFiltered: criteriaResult.totalCount,
                data: criteriaResult
        ]
        render dataTableResults as JSON
    }

    def dynamicDropDown = {

    }

    def findAnnonceForUser = {
        def user = User.get(params.user.id)
        render(template: 'annonce', model: [annonce: user.annonces])
    }

    /*def listAllUser(){
        def user = User.list()
    }*/
    def index(){

    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }

        flash.message = "User created successfully !"
        redirect(action: "index")
    }

    def edit(String id) {
        respond userService.get(id)
    }

    def update(User user) {
        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        flash.message =" User updated successfully"
        redirect(action: "index")
    }

    def delete(String id) {
        try{
            userService.delete(id)
            flash.message = "User Deleted"
        }catch(Exception ex){
            flash.message = "Could not delete user"
        }
        redirect(action:"index")
    }
}
