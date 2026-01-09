// Imports
//#import "@preview/brilliant-cv:3.1.1": letter
#import "../src/lib.typ": letter
#let metadata = toml("./metadata.toml")


#show: letter.with(
  metadata,
  sender-address: "Nandi Gardens,
J P Nagar 9th phase,
Banaglore 560062e",
  recipient-name: "Hiring Manager
  NVidia",
  recipient-address: "Bangalore",
  date: datetime.today().display(),
  subject: "Subject: Hey!",
  signature: image("assets/signature.png"),
)


Dear Hiring Manager,

My name is Hari Shankar, currently in my third year of B.Tech in Electronics and Communication Engineering at Amrita Vishwa Vidyapeetham. I am writing to express my interest in securing an internship at Tata. I’ve always admired how Tata works across so many fields, from engineering to large-scale industry. It’s rare to see such reach and influence, and it makes me want to be a part of it. The idea of learning in an environment where technology is built to solve real problems genuinely excites me.

During my coursework and project work, I’ve gained hands-on exposure to embedded systems, communication theory, and microelectronics. I’ve worked with microcontrollers, begun exploring PCB design, and developed a strong interest in hardware–software integration. I’ve found that the most valuable learning often happens when something fails and needs debugging, and that curiosity-driven iteration is something I enjoy. I am comfortable working in Python and embedded C, and I thrive in collaborative environments where ideas grow through experimentation and discussion.

I’m seeking an internship that allows me to apply my skills meaningfully while continuing to learn and challenge myself. Tata stands out to me not only for its technological influence but also for its culture of innovation, social impact, and practical engineering thinking. I would be excited for the chance to contribute while learning from experts.

Thank you for considering my application. I would be glad to share more about my work or projects if required, and I would appreciate the opportunity to interview. I look forward to the possibility of contributing and growing with Tata.

Sincerely, \
Hari Shankar