// Imports
//#import "@preview/brilliant-cv:3.1.1": cv
#import "../src/lib.typ": cv
#let metadata = toml("./metadata.toml")

#let import-modules(modules, lang: metadata.language) = {
  for module in modules {
    include {
      "modules_" + lang + "/" + module + ".typ"
    }
  }
}

#show: cv.with(
  metadata,
  profile-photo: image("assets/avatar.png")
)

#import-modules((
  "education",
  "professional",
  "projects",
  "skills",
  "certificates",
  //"publications",
))
