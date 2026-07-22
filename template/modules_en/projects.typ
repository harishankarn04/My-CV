// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry
#import "../../src/lib.typ": cv-section, cv-entry
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)
#import "../profiles.typ": on

#cv-section("Projects & Associations")

// id: sdr
#if on("sdr") { cv-entry(
  title: [Embedded Systems Developer (Academic Project)],
  society: [Software-Defined Radio Transceiver for Image & Video ( 10 Months )],
  date: [Jul 2025 – April 2026],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
  [Designing and develop SDR-based transceiver for real-time image and video transmission using *GNU Radio*],
  [Implementing end-to-end communication chain (encoding → modulation → channel → demodulation → decoding)],
  [Evaluating modulation schemes (*GMSK, QAM, OFDM*), analyzing noise sensitivity, packet loss, synchronization, and QoS],
  [Integrating video compression (*H.264, MJPEG*) and studying bandwidth–latency–quality trade-offs for wireless transmission]
),
    tags: ("Linux", "SDR", "GNU Radio", "GStreamer", "DSP", "Wireless Communication", "USRP" )
) }


// id: rag
#if on("rag") { cv-entry(
  title: [Machine Learning Developer (Academic Project)],
  society: [Context-Aware RAG Chatbot System ( 4 Months )],
  date: [Jan 2025 – May 2025],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
        [Deployed a RAG chatbot with web scraping and an ingestion pipeline using sitemaps & HTML parsing],
        [Developed *document chunking and FAISS-based vector retrieval* to enable relevant, up-to-date context retrieval],
        [*LangChain* orchestration for embedding, retrieval, and LLM interaction with support for periodic knowledge base refresh],
        [Built and tested local web interface to query real data from the university website, handling the project from start to finish]
  ),
  tags: ("Python","Web Scraping", "LangChain", "FAISS", "RAG", "Hugging Face" )
) }


// id: drone
#if on("drone") { cv-entry(
  title: [Embedded Systems Developer (Academic Project)],
  society: [Precision Landing of Drone in Dynamic and Static Platforms ( Ongoing )],
  date: [Jul 2026 – Present],
  location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
    [Started an academic project to develop an *autonomous drone system* for flight-path following and *precision landing*],
    [Currently in the ideation phase, exploring approaches for *landing accuracy and platform detection*],
    [Considering a *beacon-based navigation approach* as one option under evaluation for final descent],
    [Reviewing *flight controller hardware options*, including Pixhawk, for future system integration]
  ),

  tags: ("Drone Systems", "Autonomous Systems", "Embedded Systems", "Flight Controllers", "Navigation Systems")
) }


// id: ble-car
#if on("ble-car") { cv-entry(
  title: [Embedded Systems Developer (Academic Project)],
  society: [BLE-Based Embedded Car System
 ( 2 Months )],
  date: [Jan 2024 – May 2024],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
    [Designed and prototyped an embedded-system-based *BLE-controlled car* and adaptive power management],
    [Integrated sensors with microcontroller and established real-time actuation and decision logic],
    [Created a mobile application using *MIT App Inventor* to communicate with and control the car via BLE]
  ),
    tags: ("C","Linux","ThingSpeak", "Raspberry Pi", "Bluetooth", "Robot Development",  "Edge Detection" )
) }


// id: bi0s
#if on("bi0s") { cv-entry(
  title: [Member – Digital Forensics],
  society: [Team bi0s - Cybersecurity Research Community (1 year 2 months)],
  date: [Nov 2023 – Dec 2024],
   location: [Amrita Vishwa Vidyapeetham, Bangalore],
  description: list(
  [Contributed as part of the forensics team, gaining exposure to *cybersecurity workflows and investigative practices*],
  [Participated in internal training and introductory problem-solving related to *digital forensics* and security],
  [Worked on practice exercises and guided tasks to understand basic evidence handling and forensic processes]
),

  tags: ("Digital Forensics", "Cybersecurity", "Kali Linux", "Security Fundamentals", "WireShark")
) }