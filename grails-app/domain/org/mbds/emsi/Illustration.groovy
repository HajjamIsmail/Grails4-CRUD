package org.mbds.emsi

class Illustration {

    String id
    String filename

    static belongsTo = [annonce: Annonce]

    static constraints = {
        filename nullable: false, blank: false
    }

    static mapping = {
        id generator: 'uuid'
    }
}
