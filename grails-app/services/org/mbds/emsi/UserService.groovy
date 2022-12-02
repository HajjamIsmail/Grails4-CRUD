package org.mbds.emsi

import grails.gorm.services.Service

@Service(User)
interface UserService {

    User get(String id)

    Long count()

    //List<User> list()

    void delete(String id)

    User save(User user)

}