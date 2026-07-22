# My CV Project

This is my personal CV and cover letter project, built using Typst and based on
the Brilliant CV template.

## How to Build

```bash
./compile.sh              # full CV      -> build/Hari_Shankar_N.pdf
./compile.sh college      # a variant    -> build/Hari_Shankar_N_college.pdf
./compile.sh --list       # every toggleable entry and which variants hide it
./compile.sh --help
```

Requires [Typst](https://github.com/typst/typst). Everything else is plain
`bash` and `awk`, so there is nothing to install.

## Profiles (tailoring the CV per application)

One branch produces every variant. Entries are **visible by default**; a
profile only lists what it *hides*, at the bottom of `template/metadata.toml`:

```toml
[profiles.college]
    hide = ["rag", "ble-car", "bi0s"]
```

Run `./compile.sh --list` to see every id next to the entry it belongs to —
the ids are read straight from the source, so a newly added entry appears
automatically with nothing to register. A hidden id that matches no entry
fails the build rather than silently doing nothing.

To add a new entry, wrap it the same way as its neighbours:

```typst
// id: my-new-project
#if on("my-new-project") { cv-entry(
  ...
) }
```

`preview_profile` near the top of `template/metadata.toml` selects which
variant the live editor preview (Tinymist / VS Code) renders, since the
preview cannot pass `--input`. It does not affect `./compile.sh`.

## Credits

This project is based on the [Brilliant CV](https://github.com/yunanwg/brilliant-CV)
template by **yunanwg**. The template — its layout engine, styling and document
structure — is their work, and all credit for it belongs to them. Thanks for the
awesome work!

### My local modifications

So it is clear what is upstream and what is not, the following diverge from the
original template. Everything else under `src/` and `docs/` is unmodified
upstream code.

- **`src/cv.typ`** — entries, skill rows and certificate lines are wrapped in
  `block(breakable: false)` and section headings in `block(sticky: true)`, so an
  entry is never split across a page boundary.
- **`template/profiles.typ`, `tools/profiles.awk`, `compile.sh`** — the profile
  system described above. Not part of the original template.
- **`template/modules_en/*.typ`** — my own CV content, plus `#if on("id")`
  wrappers; the Skills, Certifications and Publications sections are wrapped so
  each moves as a single block.
- **Removed** Chinese and Italian language support (`[lang.zh]`, `[lang.it]`,
  `[lang.non_latin]`) and their cases in `src/utils/lang.typ`.

For the unmodified template, use the upstream repository linked above.
