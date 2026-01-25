// Imports
//#import "@preview/brilliant-cv:3.1.1": cv-section, cv-honor
#import "../../src/lib.typ": cv-section, cv-honor
#let metadata = toml("../metadata.toml")
#let cv-section = cv-section.with(metadata: metadata)
#let cv-honor = cv-honor.with(metadata: metadata)


#cv-section("Trainings & Certifications")

// #cv-honor(
//   date: [2022],
//   title: [AWS Certified Security - Specialty],
//   issuer: [Amazon Web Services (AWS)],
//   url: "https://aws.amazon.com/certification/",
//   location: [Online],
// )
#cv-honor(
  date: [2025],
  title: [Building Conversational AI Application],
  issuer: [NVIDIA],
  url: "https://drive.google.com/file/d/1eM2tkbLaZki_7JZ4Dg3lW8kldgbd34WA/view?usp=share_link",
  location: [Online],
)
#cv-honor(
  date: [2024],
  title: [Semiconductor Technology & Microfabrication],
  issuer: [IISc Bangalore],
  url: "https://drive.google.com/file/d/1qstijq6y88ueDMcEr4KMK7WwIXGaU7u3/view?usp=sharing",
  location: [On Site],
)

#cv-honor(
  date: [2024],
  title: [Airborne Surveillance Systems Training],
  issuer: [Centre for Airborne Systems, DRDO],
  url: "https://drive.google.com/file/d/1zNnNimxC7iCU8YA6Z12kzF9BHkU6VKTF/view?usp=sharing",
  location: [On Site],
)

#cv-honor(
  date: [2023],
  title: [Google Cloud Computing Foundations Certificate],
  issuer: [Google Cloud Skills],
  url: "https://www.credly.com/badges/a5e2df60-dcce-4b6f-82bd-bcf1212ca5b3/linked_in_profile",
  location: [Online],
)

#cv-honor(
  date: [2023],
  title: [Essentials of Cybersecurity Certification],
  issuer: [NSPE],
  url: "https://drive.google.com/file/d/1abOLbMtunmWc5f1tYcg-5pFViB8RGLP4/view?usp=sharing",
  location: [Online],
)

#cv-honor(
  date: [2023],
  title: [Remote Sensing & GIS for Hydro-Meteorological Disasters],
  issuer: [ISRO],
  url: "https://drive.google.com/file/d/156W5cdeT7MohU757P-11QhH9KAwURuvR/view?usp=sharing",
  location: [Online],
)

#cv-honor(
  date: [2023],
  title: [Embedded Programming & Microcontroller Applications],
  issuer: [Teachnook],
  url: "https://drive.google.com/file/d/1oKKR940Dt8y-v5sihoKXuE2L3GROxbE0/view?usp=sharing",
  location: [Online],
)