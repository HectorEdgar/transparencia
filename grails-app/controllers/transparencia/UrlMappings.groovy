package transparencia

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/registro"(view: "/registro")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
