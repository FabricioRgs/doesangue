package doesangue

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/cadDoador"(view:"/cadastroDoador")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
