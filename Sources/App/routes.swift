import Vapor

struct IndexContext: Encodable {
    var dishes: [Dish]?
}

/// Register your application's routes here.
public func routes(_ router: Router) throws {
   
    router.get("/") { request -> Future<View> in
        
        
        
        
        return Dish.query(on: request).all()
            .flatMap(to: View.self) { (dishes) in
                let dishesData = dishes.isEmpty ? nil : dishes
                let context = IndexContext(dishes: dishesData)
                return try request.view().render("index", context)
            }
    }
    
    router.get("/add-new-dish") { request -> Future<View> in
        return try request.view().render("add-new-dish")
    }
    
    router.post(Dish.self, at: "/add-new-dish"){ request, dish -> Future<Response>  in
        return dish.save(on: request)
        .transform(to: request.redirect(to: "/"))
    }
}
