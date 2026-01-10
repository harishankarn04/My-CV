// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-entry, h-bar
#import "../../src/lib.typ": cv-section, cv-entry, h-bar
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-entry = cv-entry.with(metadata: metadata)


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


#cv-entry(
  title: [Bachelor in Technology in Electronics and Communication  #h-bar() GPA : 7.23],
  society: [Amrita Vishwa Vidyapeetham, Bangalore],
  date: [2023 - 2027],
  location: [India],
  logo: image("../assets/logos/Amrita_Vishwa_Vidyapeetham_-_Logo.png"),
  description: list(
    [Developing a strong foundation in electronics and communication systems, with a focus on integrating hardware and software to build innovative solutions.],
  ),
  tags: ("Embedded systems","Digital Signal Processing"," IoT","Protocols","Networking","RTOS"))
  
#cv-entry(
  title: [Bachelor of Science in Data Science #h-bar() GPA : 7.3],
  society: [Indian Institute of Technology, Madras],
  date: [2023 - 2028],
  location: [India],
  logo: image("../assets/logos/IIT_Madras_Logo.png"),
  description: list(
    [Exploring intersection of data science and technology, applying statistical and computational techniques to analyze complex datasets and develop intelligent solutions.],
  ),
    tags: ("Statistical Analysis","Data Visualization"," Machine learning"," Deep Learning","RDBMS","Linux"))
