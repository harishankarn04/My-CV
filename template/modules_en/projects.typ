// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry
#import "../../src/lib.typ": cv-section, cv-entry
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)

#cv-section("Projects & Associations")

#cv-entry(
  title: [Student SDR Systems Engineer],
  society: [Software Defined Radio - Based Image & Video Transceiver],
  date: [2025 – Present],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
  [Designing and implementing an SDR-based transceiver for real-time image and video transmission using *GNU Radio*],
  [Implementing the end-to-end communication chain (encoding → modulation → channel → demodulation → decoding)],
  [Evaluating modulation schemes (*GMSK, QAM, OFDM*) and analyzing noise sensitivity, packet loss, synchronization, and QoS metrics],
  [Integrating video compression (*H.264, MJPEG*) and studying bandwidth–latency–quality trade-offs for wireless transmission]
),
    tags: ("SDR", "GNU Radio", "GStreamer", "DSP", "Wireless Communication", "USRP")
)

#cv-entry(
  title: [Machine Learning Project],
  society: [Context-Aware RAG Chatbot System ( 4 Months )],
  date: [Jan 2025 – May 2025],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
        [Deployed a RAG chatbot with web scraping and an ingestion pipeline using sitemaps & HTML parsing],
        [Developed *document chunking and FAISS-based vector retrieval* to enable relevant, up-to-date context retrieval],
        [Integrated *LangChain* to orchestrate embedding, retrieval, and LLM interaction with support for periodic knowledge base refresh],
        [Built and tested a local web interface to query real data from the university website, handling the project from start to finish]
  ),
  tags: ("Python","Web Scraping", "LangChain", "FAISS", "RAG", "Hugging Face" )
)


#cv-entry(
  title: [Student Embedded Systems Engineer],
  society: [BLE-Controlled Embedded Car System
 ( 2 Months )],
  date: [Jan 2024 – May 2024],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
    [Designed and prototyped an embedded-system-based *BLE-controlled car* and adaptive power control],
    [Integrated sensors with microcontroller and established real-time control logic],
    [Created a mobile application using *MIT App Inventor* to communicate with and control the car via BLE]
  ),
    tags: ("C","Linux","ThingSpeak", "Raspberry Pi", "Bluetooth", "Power Management", "Robot Development",  "Edge Detection" )
)

#cv-entry(
  title: [Member – Digital Forensics],
  society: [Team bi0s - Cybersecurity Research Community (1 year 2 months)],
  date: [Nov 2023 – Dec 2024],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
  [Contributed as part of the forensics team, gaining exposure to *cybersecurity workflows and investigative practices*],
  [Participated in internal training and introductory problem-solving related to *digital forensics* and security fundamentals],
  [Worked on practice exercises and guided tasks to understand basic evidence handling and forensic processes]
),

  tags: ("Digital Forensics", "Cybersecurity", "Kali Linux", "Security Fundamentals", "WireShark")
)