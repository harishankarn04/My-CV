#let _is-non-latin(lang) = {
  let non-latin-language-code = ("ja", "ko", "ru")
  return non-latin-language-code.contains(lang)
}

#let _default-date-width(lang) = {
  return if lang == "en" {
    3.6cm
  } else if lang == "fr" {
    3.4cm
  } else {
    // default to English
    3.6cm
  }
}