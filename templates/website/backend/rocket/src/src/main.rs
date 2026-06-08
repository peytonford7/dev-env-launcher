#[macro_use]
extern crate rocket;

#[get("/")]
fn index() -> &'static str {
    "Put Your Application Here!"
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}
