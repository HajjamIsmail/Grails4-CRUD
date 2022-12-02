package org.mbds.emsi

import grails.gorm.services.Service

@Service(Annonce)
interface AnnonceService {

    Annonce get(String id)

    Long count()

    //List<Annonce> list()

    void delete(String id)

    Annonce save(Annonce annonce)

}