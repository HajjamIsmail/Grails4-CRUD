package org.mbds.emsi

class User {
    String id
    String firstName
    String lastName
    String emailAddress
    String phoneNumber
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [annonces: Annonce]

    static constraints = {
        firstName nullable: false, blank: false
        lastName nullable: false, blank: false
        emailAddress nullable: false, blank: false, unique: true
        phoneNumber nullable: false, blank: false, unique: true
        password nullable: false, blank: false, password: true
    }

    static mapping = {
        id generator: 'uuid'
    }
}
