#import "@preview/oxifmt:1.0.0": strfmt


// ==== Variables ====
#let name = "Et Cætera"
#let address = "123 Example Street, 00000, Utopie"
#let phone = "+0 123 456 789"
#let email = "hire.me@simplelogin.com"
#let position_title = "C3PO"
#let reference_number = "2026-newGalaxy"

#let svg_header = strfmt(
  read("entete.svg"),
  name: name,
  address: address,
  phone: phone,
  position_title: position_title,
  email: email,
)

// Metadata
#set document(
  title: name + " — Lettre de Motivation",
  author: name,
)

// ==== Header ====
#let page_width = 210mm
#set page(
  paper: "a4",
  // Set your desired margins for the main body content
  margin: (top: 46mm, bottom: 20mm, x: 10mm),
  header-ascent: 0%,
  // Define the header content
  header: [
    // Use a block with infinite width to span the whole page width
    #block(
      width: page_width,
      height: 46mm,
      inset: (left: -1cm, right: -1cm),
      {
        image(bytes(svg_header))
      },
    )
  ],
)

// ==== Body ====
#set text(font: "Arial", size: 12pt)
#set par(justify: true)
#v(15mm)

// Lettre
#text(strong("Objet") + " : Candidature au poste " + position_title + " – Ref. " + reference_number)
#v(5mm)

Madame, Monsieur,
#v(1mm)

#lorem(120)

#lorem(130)

#lorem(100) // Sample body text to show the margin around the main content

#v(10mm)
Bien cordialement,

#text(name)
