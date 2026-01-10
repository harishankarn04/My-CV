// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry
#import "../../src/lib.typ": cv-section, cv-entry
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)


#cv-section("Projects & Associations")

#cv-entry(
  title: [Machine Learning Project],
  society: [Context-Aware RAG Chatbot System ( 4 Months )],
  date: [2025],
  location: [Bangalore, India],
  description: list(
        [Deployed a RAG chatbot with web scraping and an ingestion pipeline using sitemaps & HTML parsing],
        [Developed *document chunking and FAISS-based vector retrieval* to enable relevant, up-to-date context retrieval],
        [Integrated *LangChain* to orchestrate embedding, retrieval, and LLM interaction with support for periodic knowledge base refresh]

  ),
  tags: ("Python","Web Scraping", "LangChain", "FAISS", "RAG",  "Hugging Face" )
)

#cv-entry(
  title: [Embedded Systems Engineer],
  society: [Smart Systems for Automation and Control ( 2 Months )],
  date: [2024],
  location: [Bangalore, India],
  description: list(
    [Designed and prototyped an embedded-system-based *BLE-controlled car* and mmWave-based adaptive power control],
    [Integrated sensors with microcontroller and established real-time control logic],
    [Created a mobile application using *MIT App Inventor* to communicate with and control the car via *BLE*]
  ),
    tags: ("C","Linux","ThingSpeak", "Raspberry Pi", "Bluetooth", "Power Management", "Robot Development",  "Edge Detection" )
)
