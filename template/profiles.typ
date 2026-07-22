// ─────────────────────────────────────────────────────────────────────────────
//  PROFILE SWITCHING
//
//  Lets one source tree produce several tailored CVs (full / college /
//  per-company) without ever commenting entries out by hand.
//
//  HOW IT WORKS
//    Every entry in modules_en/ is wrapped in `#if on("some-id") { ... }`.
//    Entries are VISIBLE BY DEFAULT — an id only ever needs to appear in
//    metadata.toml when you want to HIDE it from a particular profile.
//    So adding a new skill/project/cert requires no config change at all.
//
//  TO SEE EVERY AVAILABLE ID
//    ./compile.sh --list
//
//  TO BUILD A PROFILE
//    ./compile.sh college
// ─────────────────────────────────────────────────────────────────────────────

// Chosen at compile time via `typst compile --input profile=college`.
#let profile = sys.inputs.at("profile", default: "full")

#let _profiles = toml("metadata.toml").at("profiles", default: (:))

// Unknown profile name is a hard error — otherwise a typo in the profile name
// silently builds the full CV and you mail out the wrong document.
#let _known = _profiles.keys()
#if profile != "full" and profile not in _known {
  panic(
    "Unknown profile '" + profile + "'. Defined profiles: "
      + if _known.len() == 0 { "(none)" } else { _known.join(", ") },
  )
}

#let _hidden = _profiles.at(profile, default: (:)).at("hide", default: ())

/// True when `id` should be rendered under the active profile.
#let on(id) = id not in _hidden

/// Use for optional sub-parts of an entry (e.g. a description block).
/// Returns "" when hidden, which is what cv-entry expects for "no description".
#let opt(id, body) = if on(id) { body } else { "" }
