// Imports
// #import "@preview/brilliant-cv:3.1.1": cv-section, cv-skill, cv-skill-with-level, cv-skill-tag, h-bar
#import "../../src/lib.typ": cv-section, cv-skill, cv-skill-with-level, cv-skill-tag, h-bar
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#import "../profiles.typ": on


// The Skills section moves as ONE unit: if it does not fit in the remaining
// space, the whole section (heading included) goes to the next page rather
// than stranding a single skill row on its own.
#block(breakable: false, width: 100%)[
#cv-section("Skills")

// #cv-skill-with-level(
//   type: [Languages],
//   level: 4,
//   info: [English (Native) #h-bar() French (Fluent) #h-bar() Chinese (Conversational)],
// )

// #cv-skill-with-level(
//   type: [Programming],
//   level: 5,
//   info: [Python #h-bar() SQL #h-bar() R],
// )

// #cv-skill(
//   type: [Tech Stack],
//   info: [Tableau #h-bar() Snowflake #h-bar() AWS #h-bar() Docker #h-bar() Git],
// )

// #cv-skill(
//   type: [Frameworks & Libraries],
//   info: [Pandas #h-bar() NumPy #h-bar() Scikit-learn #h-bar() TensorFlow #h-bar() FastAPI],
// )

// // Skill tags example
// #cv-skill(
//   type: [Certifications],
//   info: [
//     #cv-skill-tag([AWS Certified])
//     #cv-skill-tag([Google Analytics])
//     #cv-skill-tag([Tableau Desktop])
//     #cv-skill-tag([Scrum Master])
//   ],
// )

// #cv-skill(
//   type: [Personal Interests],
//   info: [Swimming #h-bar() Cooking #h-bar() Reading #h-bar() Photography],
// )


// id: skill-languages
#if on("skill-languages") { cv-skill(
  type: [Language & Libs],
  info: [*C* #h-bar() *Bare-metal C* #h-bar() *C++* /*#h-bar() OOAD*/ #h-bar() Python #h-bar() Bash Scripting #h-bar() SQL],
) }

// id: skill-ai
#if on("skill-ai") { cv-skill(
  type: [AI & LLM],
  info: [RAG Pipelines #h-bar() LangChain #h-bar() FAISS #h-bar() Hugging Face #h-bar() LLM APIs #h-bar() AI-Assisted Development],
) }

// id: skill-embedded
#if on("skill-embedded") { cv-skill(
  type: [Embedded Systems],
  info: [*STM32* #h-bar() *NXP i.MX RT* #h-bar() ESP32 #h-bar() Cross-compiler #h-bar() *GDB* #h-bar() IoT #h-bar() Raspberry Pi]
) }

// id: skill-tools
#if on("skill-tools") { cv-skill(
  type: [Software & Tools],
  info: [*Git* #h-bar() VS Code #h-bar() *MCUXpresso* #h-bar() *STM32CubeIDE* #h-bar() GNU Radio #h-bar()  MariaDB],
) }

// id: skill-os
#if on("skill-os") { cv-skill(
  type: [OS & Network],
  info: [ *Linux* #h-bar() Windows #h-bar() Containerization #h-bar() Virtualization ],
) }

// id: skill-cloud
#if on("skill-cloud") { cv-skill(
  type: [Cloud & Platforms],
  info: [*Google Cloud Platform* #h-bar() AWS  #h-bar() WireShark],
) }

// id: skill-traits
#if on("skill-traits") { cv-skill(
  type: [Personal Traits],
  info: [*Team Player* #h-bar() Problem Solving #h-bar() *Communicator* #h-bar()  Accountability #h-bar() Guitarist #h-bar() Artist],
) }
]
