// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry, cv-entry-start, cv-entry-continued
#import "../../src/lib.typ": cv-section, cv-entry, cv-entry-start, cv-entry-continued
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)
#let cv-entry-start = cv-entry-start.with(metadata: metadata)
#let cv-entry-continued = cv-entry-continued.with(metadata: metadata)


#cv-section("Internship Experience")

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

// ------------ DIGICOMM ------------ //
#cv-entry(
  title: [Embedded Systems Intern],
  society: [Digicomm Semiconductors Pvt. Ltd ( 8 Months )],
  logo: image("../assets/logos/Digicomm_Semiconductor.png"),
  date: [Jun 2025 – Jan 2026],
  location: [Bangalore, India],
  description: list(
  [Performed *STM32 board bring-up* using Embedded C and configured communication protocols (*UART, SPI, I2C, ADC*)],
  [Used *Cross-compiling* toolchains for target hardware, debug firmware issues, and performed system-level validation],
  [Engineered a *CMake*-based CI/CD build system using *Docker* for bare-metal projects],
  [Built a *text rendering subsystem* on *NXP i.MX* by porting and configuring *HarfBuzz* and *FreeType* to enable *Indic* scripts],
  [Implemented text shaping and glyph rendering flow to operate reliably in a resource-constrained, *OS-independent* environment]
  ),
  tags: ("ARM Cortex-M (M3/M4/M7)","NXP i.MX RT1064",
    "STM32", "Bare-metal", "Linux", "Docker", "Embedded C", "Meson", "GDB" )
)
// ------------ DIGICOMM ------------ //

// ------------ OPTIMUS LOGIC ------------ //
#cv-entry(
  title: [Embedded Systems Intern],
  society: [OptimusLogic Systems Pvt Ltd],

  // Making Optmius image fit properly with custom sizing
  logo: box(
  width: 20pt,
  height: 20pt,
  clip: true,
)[
  #pad(left: 0pt, right: 3pt)[
    #image("../assets/logos/Optimus_Logic.png", fit: "contain")
  ]
],
  // logo: box(
  // width: 20pt,
  // height: 20pt,
  // clip: true,
  // )[
  //   #image("../assets/logos/Optimus_Logic.png", fit: "contain")
  // ],

  date: [Jun 2026 – Present],
  location: [Bangalore, India],
  description: list(
    [Worked with *OrCAD Capture* to replicate and modify a reference schematic for a *LoRa-based evaluation board*],
    [Replaced the reference Xiao module with an *RP2350 (Raspberry Pi Pico 2)* in the schematic],
    [Reproduced the *LR2021 LoRa transceiver* RF section based on Semtech's reference design],
    [Ran and cleared all *DRC/ERC checks* on the schematic prior to handoff for layout]
  ),

  tags: ("OrCAD Capture", "Schematic Design", "RP2350", "LoRa", "Semtech LR2021", "RF Fundamentals")
)
// ------------ OPTIMUS LOGIC ------------ //