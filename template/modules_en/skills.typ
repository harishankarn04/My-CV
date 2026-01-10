// Imports
// #import "@preview/brilliant-cv:3.1.1": cv-section, cv-skill, cv-skill-with-level, cv-skill-tag, h-bar
#import "../../src/lib.typ": cv-section, cv-skill, cv-skill-with-level, cv-skill-tag, h-bar
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)


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


  #cv-skill(
  type: [Language & Libs],
  info: [*C* #h-bar() *C++* #h-bar() Python #h-bar() Bash Scripting #h-bar() SQL],
)

#cv-skill(
  type: [Embedded Systems],
  info: [*STM32 * #h-bar() *NXP i.MX RT
* #h-bar() *ESP32* #h-bar() *Bare-metal C* #h-bar() IoT #h-bar() Raspberry Pi],
)

#cv-skill(
  type: [Software & Tools],
  info: [*Git* #h-bar() VS Code #h-bar() *MCUXpresso* #h-bar() *STM32CubeIDE* #h-bar() STM32 #h-bar() OOAD #h-bar() MariaDB #h-bar() MS Office Tools],
)
/*
#cv-skill(
  type: [Data Science],
  info:[Transformers #h-bar() FAISS #h-bar() RAG Pipeline #h-bar() NLP Workflow#h-bar() MariaDB],
)
*/

  #cv-skill(
  type: [OS & Network],
  info: [ *Linux* #h-bar() Windows#h-bar() Containerization #h-bar() Virtualization ],
)

#cv-skill(
  type: [Cloud & Security],
  info: [*GCP* #h-bar() AWS #h-bar()  Basic Cybersecurity #h-bar() Open Source Security Tools #h-bar() CTF],
)

#cv-skill(
  type: [Personal Traits],
  info: [*Team Player* #h-bar() Problem Solving #h-bar() *Communicator* #h-bar()  Accountability #h-bar() Guitarist #h-bar() Artist],
)
