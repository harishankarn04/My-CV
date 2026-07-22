// Imports
// #import "@preview/brilliant-cv:3.1.1": cv-section, cv-publication
#import "../../src/lib.typ": cv-section, cv-publication
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)


// Publications move as ONE unit: like Skills and Certifications these are
// short reference lines, and a list torn across a page reads as broken.
#block(breakable: false, width: 100%)[
#cv-section("Publications")

// Example 1: Selected publications with custom style
#cv-publication(
  bib: bibliography("../assets/publications.bib"),
  key-list: (
    "smith2020",
    "jones2021",
    "wilson2022",
  ),
  ref-style: "ieee",
  ref-full: false,
)

// Example 2: All publications with APA style (commented out to avoid duplication)
// #cv-publication(
//   bib: bibliography("../assets/publications.bib"),
//   ref-style: "apa",
//   ref-full: true,
// )
]
