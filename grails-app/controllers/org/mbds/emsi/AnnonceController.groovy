package org.mbds.emsi

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AnnonceController {

    AnnonceService annonceService

    def data_for_datatable() {
        int draw = params.int("draw")
        int length = params.int("length")
        int start = params.int("start")
        String dataTableOrderColumnIdx = params["order[0][column]"]
        String dataTableOrderColumnName = "columns[" + dataTableOrderColumnIdx + "][data]"
        String sortName = params[dataTableOrderColumnName] ?: "id"
        String sortDir = params["order[0][dir]"] ?: "asc"
        String queryString = params["search[value]"]
        PagedResultList criteriaResult = Annonce.createCriteria().list([max: length, offset:start]) {
            readOnly true
            or {
                ilike('id', '%' +  queryString + '%')
                ilike('title', '%' + queryString + '%')
                ilike('description', '%' + queryString + '%')
                ilike('price', '%' + queryString + '%')
                ilike('isActive', '%' + queryString + '%')
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

    def index(){ }

    def create() {
        respond new Annonce(params)
    }

    def save(Annonce annonce) {
        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }
        flash.message = "Annonce created successfully !"
        redirect(action: "index")
    }

    def edit(String id) {
        respond annonceService.get(id)
    }

    def update(Annonce annonce) {
        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        flash.message="Annonce updated successfully !"
        redirect(action: "index")
    }

    def delete(Long id) {
        try{
            annonceService.delete(id)
            flash.message = "Annonce Deleted"
        }
        catch (Exception ex){
            flash.message = "Could not delete annonce"
        }
    }
}
