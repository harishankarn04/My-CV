// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry, h-bar
#import "../../src/lib.typ": cv-section, cv-entry, h-bar
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)
#import "../profiles.typ": on, opt


#cv-section("Education")

// #cv-entry(
//   title: [Master of Data Science],
//   society: [University of California, Los Angeles],
//   date: [2018 - 2020],
//   location: [USA],
//   logo: image("../assets/logos/ucla.png"),
//   description: list(
//     [Thesis: Predicting Customer Churn in Telecommunications Industry using Machine Learning Algorithms and Network Analysis],
//     [Course: Big Data Systems and Technologies #h-bar() Data Mining and Exploration #h-bar() Natural Language Processing],
//   ),
// )


// id: btech   (description sub-toggle: btech-desc)
#if on("btech") { cv-entry(
  title: [Bachelor's in Technology in Electronics and Communication  #h-bar() GPA : 7.36],
  society: [Amrita Vishwa Vidyapeetham],
  date: [Jul 2023 - Present],
  location: [Bangalore, India],
  logo: image("../assets/logos/Amrita_Vishwa_Vidyapeetham_-_Logo.png"),
  description: opt("btech-desc", list(
    [Developing a strong foundation in electronics and communication systems, with a focus on integrating hardware, circuit design, signal processing and software to build innovative solutions across embedded systems and real-time applications],
    [Gained hands-on experience in circuit design, signal processing, and IoT development through projects involving microcontroller programming, communication protocols, and system-level validation]
  )),

  tags: ("Embedded Systems","Digital Signal Processing","IoT","Protocols","Networking","RTOS", "C", "Wireshark")) }
  
// id: bsc-ds   (description sub-toggle: bsc-ds-desc)
#if on("bsc-ds") { cv-entry(
  title: [Bachelor of Science in Data Science #h-bar() GPA : 7.3],
  society: [Indian Institute of Technology],
  date: [Jul 2023 - Present],
  location: [Madras, India],
  logo: image("../assets/logos/IIT_Madras_Logo.png"),
  description: opt("bsc-ds-desc", list(
    [Exploring the intersection of data science and technology, applying statistical and computational techniques to analyze complex datasets and develop intelligent solutions],
  )),
    tags: ("Statistical Analysis","Data Visualization","Machine Learning","Deep Learning","RDBMS","Linux")) }
