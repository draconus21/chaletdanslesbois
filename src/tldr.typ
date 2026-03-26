// Load translations
#let i18n = toml("i18n.toml")

// Determine language from input (default to 'en')
#let lang = sys.inputs.at("lang", default: "en")

// Set text direction and language for Typst's built-in features
#set text(lang: lang)

// Helper function to translate keys
#let tr(key) = {
  i18n.at(lang).at(key)
}

// Styles & Colors
#let forestgreen = rgb(34, 73, 53)
#let skybluescript = rgb(74, 144, 226)

#set page(
  margin: 1in,
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
)

// Custom components
#let chaletlogo(width: 100%) = {
  image("../graphics/logo.png", width: width)
}

#let mysection(title) = {
  v(1.5em)
  text(fill: skybluescript, size: 2em, weight: "bold", style: "italic")[#title]
  v(1em)
}

#let separator = {
  v(1em)
  line(length: 100%, stroke: 0.5pt)
  v(1em)
}

#let warnsign = text(fill: red, weight: "bold")[(!!)]
#let checkitem = [✓]

// --- PAGE 1: COVER ---
#align(center + horizon)[
  #chaletlogo(width: 50%)

  #v(2em)
  #text(fill: forestgreen, size: 3em, weight: "bold")[CHALET DANS LES BOIS]

  #v(4em)
  #text(size: 1.2em)[#tr("cover_welcome")]

  #v(1fr)
  #line(length: 100%)
]

#pagebreak()

// --- PAGE 2: ARRIVAL & ACCESS ---
#mysection(tr("arrival_title"))

#block(width: 100%)[
  *#tr("arrival_address_label"):* #tr("arrival_address") \
  _#tr("arrival_gps_note")_

  #v(1em)
  *#tr("arrival_parking_label"):* #tr("arrival_parking") \
  #warnsign *#tr("arrival_septic_warning")*

  #v(1em)
  *#tr("arrival_entry_label"):* #tr("arrival_entry") \
  _#tr("arrival_winter_note")_

  #v(1em)
  *#tr("arrival_shoes_label"):* #tr("arrival_shoes")

  #v(1em)
  *#tr("arrival_wifi_label"):* #tr("arrival_wifi") \
  _#tr("arrival_wifi_note")_
]

#separator

#mysection(tr("amenities_title"))

*#tr("amenities_septic_label")*
- #tr("amenities_septic_item_1")
- #tr("amenities_septic_item_2")
- #tr("amenities_septic_item_3")

#v(1em)
*#tr("amenities_hottub_label")*
- #tr("amenities_hottub_item_1")
- #tr("amenities_hottub_item_2")
- #tr("amenities_hottub_item_3")
- *#tr("amenities_hottub_item_4")*

#pagebreak()

// --- PAGE 3: SAFETY & KITCHEN ---
*#tr("safety_label")*
- #tr("safety_first_aid")
- #tr("safety_fire_blanket")
- #tr("safety_extinguisher")
- #tr("safety_child_gates")

#v(1em)
*#tr("kitchen_label")*
- *#tr("kitchen_provided_label"):* #tr("kitchen_provided")
- *#tr("kitchen_bring_label"):* #tr("kitchen_bring")
- *#tr("kitchen_equipment_label"):* #tr("kitchen_equipment")
- *#tr("kitchen_bedding_label"):* #tr("kitchen_bedding")
- *#tr("kitchen_waste_label"):* #tr("kitchen_waste")

#separator

#mysection(tr("fire_title"))

*#tr("fire_indoor_label")*
- #tr("fire_indoor_item_1")
- #tr("fire_indoor_item_2")
- *#tr("fire_indoor_item_3")*

#v(1em)
*#tr("fire_outdoor_label")*
- #tr("fire_outdoor_item_1")
- #tr("fire_outdoor_item_2")
- *#tr("fire_outdoor_item_3")*

#separator

#mysection(tr("misc_title"))
- #tr("misc_window")

#pagebreak()

// --- PAGE 4: RULES & DEPARTURE ---
#mysection(tr("rules_title"))
- #tr("rules_item_1")
- *#tr("rules_item_2")*
- #tr("rules_item_3")
- #tr("rules_item_4")

#mysection(tr("departure_title"))
#tr("departure_intro")

#v(1em)
#grid(
  columns: (2em, 1fr),
  row-gutter: 1em,
  checkitem, [*#tr("departure_sheets_label"):* #tr("departure_sheets")],
  checkitem, [*#tr("departure_fridge_label"):* #tr("departure_fridge")],
  checkitem, [*#tr("departure_trash_label"):* #tr("departure_trash")],
  checkitem, [*#tr("departure_dishes_label"):* #tr("departure_dishes")],
  checkitem, [*#tr("departure_hottub_label"):* #tr("departure_hottub")],
  checkitem, [*#tr("departure_utilities_label"):* #tr("departure_utilities")],
  checkitem, [*#tr("departure_outdoor_label"):* #tr("departure_outdoor")],
  checkitem, [*#tr("departure_door_label"):* #tr("departure_door")],
)

#v(1em)
#warnsign *#tr("departure_warning")*

#separator

#pagebreak()

// --- PAGE 5: NEARBY ACTIVITIES ---
#mysection(tr("activities_title"))

*#tr("activity_masson_label")*
- #tr("activity_masson_item_1")
- #tr("activity_masson_item_2")
- #tr("activity_masson_item_3")

#v(1em)
*#tr("activity_chertsey_label")*
- #tr("activity_chertsey_item_1")
- #tr("activity_chertsey_item_2")

#v(1em)
*#tr("activity_daytrips_label")*
- #tr("activity_daytrip_1")
- #tr("activity_daytrip_2")
- #tr("activity_daytrip_3")
- #tr("activity_daytrip_4")

#v(1fr)

#separator
#v(1em)
*#tr("footer_questions")*

#tr("footer_enjoy") \ \
- Neeth, Ewa & Eugine
