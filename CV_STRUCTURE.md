# CV Structure Reference

## Section Titles
Section titles are set via `cv-section("Title")` in each module file.

| Section          | File                                    | Line |
|------------------|-----------------------------------------|------|
| Education        | `template/modules_en/education.typ`     | 9    |
| Professional Exp | `template/modules_en/professional.typ`  | 11   |
| Projects         | `template/modules_en/projects.typ`      | -    |
| Skills           | `template/modules_en/skills.typ`        | -    |
| Certificates     | `template/modules_en/certificates.typ`  | -    |
| Publications     | `template/modules_en/publications.typ`  | -    |

## cv-entry Parameters (defined in `src/cv.typ` line 686)
- `title` — Bold entry title (e.g. job role, degree name)
- `society` — Organization name (company, university)
- `date` — Date range
- `location` — City, Country
- `description` — Bullet list of details. Default is `""` (empty, renders nothing). Comment it out to hide.
- `logo` — Image for the organization logo
- `tags` — Tuple of skill tags shown as chips below the entry

## Description Behavior
- `description` default was changed from `"Description"` to `""` in `src/cv.typ:691`
- This means commenting out `description:` in an entry no longer shows a default "Description" text
- The description is rendered by `_make-cv-entry` in `src/cv.typ` (line ~610 for "full" entries)

## Section Title Styling (defined in `src/cv.typ` line 270)
- `cv-section` highlights the first 3 letters in accent color by default
- Controlled by `highlighted` (bool) and `letters` (int) parameters
