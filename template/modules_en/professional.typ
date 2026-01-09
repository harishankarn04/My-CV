// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry, cv-entry-start, cv-entry-continued
#import "../../src/lib.typ": cv-section, cv-entry, cv-entry-start, cv-entry-continued
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)
#let cv-entry-start = cv-entry-start.with(metadata: metadata)
#let cv-entry-continued = cv-entry-continued.with(metadata: metadata)


#cv-section("Professional Experience")

// #cv-entry-start(
//   society: [XYZ Corporation],
//   logo: image("../assets/logos/xyz_corp.png"),
//   location: [San Francisco, CA],
// )

// #cv-entry-continued(
//   title: [Director of Data Science],
//   description: list(
//     [Lead a team of data scientists and analysts to develop and implement data-driven strategies, develop predictive models and algorithms to support decision-making across the organization],
//     [Collaborate with executive leadership to identify business opportunities and drive growth, implement best practices for data governance, quality, and security],
//   ),
//   tags: ("Dataiku", "Snowflake", "SparkSQL"),
// )

// #cv-entry-continued(
//   title: [Data Scientist],
//   date: [2017 - 2020 #linebreak() 2021 - 2022],
//   description: list(
//     [Analyze large datasets with SQL and Python, collaborate with teams to uncover business insights],
//     [Create data visualizations and dashboards in Tableau, develop and maintain data pipelines with AWS],
//   ),
// )

#cv-entry(
  title: [Embedded Systems Intern],
  society: [Digicomm Semiconductors Pvt. Ltd ( 7 Months )],
  logo: image("../assets/logos/digicomm-semiconductor.webp"),
  date: [June 2025 – Dec 2025],
  location: [Bangalore, India],
  description: list(
  [Built firmware for *STM32 (ARM Cortex-M3/M4/M7)* using Embedded C and HAL drivers],
  [Handled *board bring-up*, debugging, peripheral interfacing, and system-level testing; created a *CMake*-based build system enabling *Docker-based CI/CD* for STM32 bare-metal projects],
  [Built a *text rendering subsystem* on *NXP i.MX RT1064 (ARM Cortex-M7)* by porting and configuring *HarfBuzz* and *FreeType* to enable Indic script rendering],
  [Designed the text shaping and glyph rendering flow to operate reliably in a resource-constrained, OS-less embedded environment]
  ),
  tags: ("ARM Cortex-M (M4/M7)","NXP i.MX RT1064",
    "STM32", "Bare-metal", "Linux", "Docker", "Embedded C", "Meson" )
)
