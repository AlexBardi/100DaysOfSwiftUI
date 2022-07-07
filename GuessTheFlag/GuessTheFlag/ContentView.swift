//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alexander Bardi on 3/6/22.
//

import SwiftUI

struct FlagButton: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingRoundEnd = false
    @State private var tapHandled = false
    
    @State private var alertTitle = ""

    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @AppStorage("highscore") private var highscore = -1
    @State private var oldHighscore = 0
    
    //@State private var scoreFinal = 0
    @State private var round = 0
    
    @State private var countries = ["af",
                                    "ax",
                                    "al",
                                    "dz",
                                    "as",
                                    "ad",
                                    "ao",
                                    "ai",
                                    "aq",
                                    "ag",
                                    "ar",
                                    "am",
                                    "aw",
                                    "au",
                                    "at",
                                    "az",
                                    "bs",
                                    "bh",
                                    "bd",
                                    "bb",
                                    "by",
                                    "be",
                                    "bz",
                                    "bj",
                                    "bm",
                                    "bt",
                                    "bo",
                                    "ba",
                                    "bw",
                                    "bv",
                                    "br",
                                    "io",
                                    "bn",
                                    "bg",
                                    "bf",
                                    "bi",
                                    "kh",
                                    "cm",
                                    "ca",
                                    "cv",
                                    "bq",
                                    "ky",
                                    "cf",
                                    "td",
                                    "cl",
                                    "cn",
                                    "cx",
                                    "cc",
                                    "co",
                                    "km",
                                    "cg",
                                    "cd",
                                    "ck",
                                    "cr",
                                    "ci",
                                    "hr",
                                    "cu",
                                    "cw",
                                    "cy",
                                    "cz",
                                    "dk",
                                    "dj",
                                    "dm",
                                    "do",
                                    "ec",
                                    "eg",
                                    "sv",
                                    "gb-eng",
                                    "gq",
                                    "er",
                                    "ee",
                                    "sz",
                                    "et",
                                    "fk",
                                    "fo",
                                    "fj",
                                    "fi",
                                    "fr",
                                    "gf",
                                    "pf",
                                    "tf",
                                    "ga",
                                    "gm",
                                    "ge",
                                    "de",
                                    "gh",
                                    "gi",
                                    "gr",
                                    "gl",
                                    "gd",
                                    "gp",
                                    "gu",
                                    "gt",
                                    "gg",
                                    "gn",
                                    "gw",
                                    "gy",
                                    "ht",
                                    "hm",
                                    "hn",
                                    "hk",
                                    "hu",
                                    "is",
                                    "in",
                                    "id",
                                    "ir",
                                    "iq",
                                    "ie",
                                    "im",
                                    "il",
                                    "it",
                                    "jm",
                                    "jp",
                                    "je",
                                    "jo",
                                    "kz",
                                    "ke",
                                    "ki",
                                    "kp",
                                    "kr",
                                    "xk",
                                    "kw",
                                    "kg",
                                    "la",
                                    "lv",
                                    "lb",
                                    "ls",
                                    "lr",
                                    "ly",
                                    "li",
                                    "lt",
                                    "lu",
                                    "mo",
                                    "mg",
                                    "mw",
                                    "my",
                                    "mv",
                                    "ml",
                                    "mt",
                                    "mh",
                                    "mq",
                                    "mr",
                                    "mu",
                                    "yt",
                                    "mx",
                                    "fm",
                                    "md",
                                    "mc",
                                    "mn",
                                    "me",
                                    "ms",
                                    "ma",
                                    "mz",
                                    "mm",
                                    "na",
                                    "nr",
                                    "np",
                                    "nl",
                                    "nc",
                                    "nz",
                                    "ni",
                                    "ne",
                                    "ng",
                                    "nu",
                                    "nf",
                                    "mk",
                                    "gb-nir",
                                    "mp",
                                    "no",
                                    "om",
                                    "pk",
                                    "pw",
                                    "ps",
                                    "pa",
                                    "pg",
                                    "py",
                                    "pe",
                                    "ph",
                                    "pn",
                                    "pl",
                                    "pt",
                                    "pr",
                                    "qa",
                                    "re",
                                    "ro",
                                    "ru",
                                    "rw",
                                    "bl",
                                    "sh",
                                    "kn",
                                    "lc",
                                    "mf",
                                    "pm",
                                    "vc",
                                    "ws",
                                    "sm",
                                    "st",
                                    "sa",
                                    "gb-sct",
                                    "sn",
                                    "rs",
                                    "sc",
                                    "sl",
                                    "sg",
                                    "sx",
                                    "sk",
                                    "si",
                                    "sb",
                                    "so",
                                    "za",
                                    "gs",
                                    "ss",
                                    "es",
                                    "lk",
                                    "sd",
                                    "sr",
                                    "sj",
                                    "se",
                                    "ch",
                                    "sy",
                                    "tw",
                                    "tj",
                                    "tz",
                                    "th",
                                    "tl",
                                    "tg",
                                    "tk",
                                    "to",
                                    "tt",
                                    "tn",
                                    "tr",
                                    "tm",
                                    "tc",
                                    "tv",
                                    "ug",
                                    "ua",
                                    "ae",
                                    "gb",
                                    "us",
                                    "um",
                                    "uy",
                                    "uz",
                                    "vu",
                                    "va",
                                    "ve",
                                    "vn",
                                    "vg",
                                    "vi",
                                    "gb-wls",
                                    "wf",
                                    "eh",
                                    "ye",
                                    "zm",
                                    "zw"
    ].shuffled()
    
    private var shortToLong = ["af" : "Afghanistan",
                               "ax" : "Åland Islands",
                               "al" : "Albania",
                               "dz" : "Algeria",
                               "as" : "American Samoa",
                               "ad" : "Andorra",
                               "ao" : "Angola",
                               "ai" : "Anguilla",
                               "aq" : "Antarctica",
                               "ag" : "Antigua and Barbuda",
                               "ar" : "Argentina",
                               "am" : "Armenia",
                               "aw" : "Aruba",
                               "au" : "Australia",
                               "at" : "Austria",
                               "az" : "Azerbaijan",
                               "bs" : "Bahamas",
                               "bh" : "Bahrain",
                               "bd" : "Bangladesh",
                               "bb" : "Barbados",
                               "by" : "Belarus",
                               "be" : "Belgium",
                               "bz" : "Belize",
                               "bj" : "Benin",
                               "bm" : "Bermuda",
                               "bt" : "Bhutan",
                               "bo" : "Bolivia",
                               "ba" : "Bosnia and Herzegovina",
                               "bw" : "Botswana",
                               "bv" : "Bouvet Island",
                               "br" : "Brazil",
                               "io" : "British Indian Ocean Territory",
                               "bn" : "Brunei",
                               "bg" : "Bulgaria",
                               "bf" : "Burkina Faso",
                               "bi" : "Burundi",
                               "kh" : "Cambodia",
                               "cm" : "Cameroon",
                               "ca" : "Canada",
                               "cv" : "Cape Verde",
                               "bq" : "Caribbean Netherlands",
                               "ky" : "Cayman Islands",
                               "cf" : "Central African Republic",
                               "td" : "Chad",
                               "cl" : "Chile",
                               "cn" : "China",
                               "cx" : "Christmas Island",
                               "cc" : "Cocos (Keeling) Islands",
                               "co" : "Colombia",
                               "km" : "Comoros",
                               "cg" : "Republic of the Congo",
                               "cd" : "DR Congo",
                               "ck" : "Cook Islands",
                               "cr" : "Costa Rica",
                               "ci" : "Côte d'Ivoire (Ivory Coast)",
                               "hr" : "Croatia",
                               "cu" : "Cuba",
                               "cw" : "Curaçao",
                               "cy" : "Cyprus",
                               "cz" : "Czechia",
                               "dk" : "Denmark",
                               "dj" : "Djibouti",
                               "dm" : "Dominica",
                               "do" : "Dominican Republic",
                               "ec" : "Ecuador",
                               "eg" : "Egypt",
                               "sv" : "El Salvador",
                               "gb-eng" : "England",
                               "gq" : "Equatorial Guinea",
                               "er" : "Eritrea",
                               "ee" : "Estonia",
                               "sz" : "Eswatini (Swaziland)",
                               "et" : "Ethiopia",
                               "fk" : "Falkland Islands",
                               "fo" : "Faroe Islands",
                               "fj" : "Fiji",
                               "fi" : "Finland",
                               "fr" : "France",
                               "gf" : "French Guiana",
                               "pf" : "French Polynesia",
                               "tf" : "French Southern and Antarctic Lands",
                               "ga" : "Gabon",
                               "gm" : "Gambia",
                               "ge" : "Georgia",
                               "de" : "Germany",
                               "gh" : "Ghana",
                               "gi" : "Gibraltar",
                               "gr" : "Greece",
                               "gl" : "Greenland",
                               "gd" : "Grenada",
                               "gp" : "Guadeloupe",
                               "gu" : "Guam",
                               "gt" : "Guatemala",
                               "gg" : "Guernsey",
                               "gn" : "Guinea",
                               "gw" : "Guinea-Bissau",
                               "gy" : "Guyana",
                               "ht" : "Haiti",
                               "hm" : "Heard Island and McDonald Islands",
                               "hn" : "Honduras",
                               "hk" : "Hong Kong",
                               "hu" : "Hungary",
                               "is" : "Iceland",
                               "in" : "India",
                               "id" : "Indonesia",
                               "ir" : "Iran",
                               "iq" : "Iraq",
                               "ie" : "Ireland",
                               "im" : "Isle of Man",
                               "il" : "Israel",
                               "it" : "Italy",
                               "jm" : "Jamaica",
                               "jp" : "Japan",
                               "je" : "Jersey",
                               "jo" : "Jordan",
                               "kz" : "Kazakhstan",
                               "ke" : "Kenya",
                               "ki" : "Kiribati",
                               "kp" : "North Korea",
                               "kr" : "South Korea",
                               "xk" : "Kosovo",
                               "kw" : "Kuwait",
                               "kg" : "Kyrgyzstan",
                               "la" : "Laos",
                               "lv" : "Latvia",
                               "lb" : "Lebanon",
                               "ls" : "Lesotho",
                               "lr" : "Liberia",
                               "ly" : "Libya",
                               "li" : "Liechtenstein",
                               "lt" : "Lithuania",
                               "lu" : "Luxembourg",
                               "mo" : "Macau",
                               "mg" : "Madagascar",
                               "mw" : "Malawi",
                               "my" : "Malaysia",
                               "mv" : "Maldives",
                               "ml" : "Mali",
                               "mt" : "Malta",
                               "mh" : "Marshall Islands",
                               "mq" : "Martinique",
                               "mr" : "Mauritania",
                               "mu" : "Mauritius",
                               "yt" : "Mayotte",
                               "mx" : "Mexico",
                               "fm" : "Micronesia",
                               "md" : "Moldova",
                               "mc" : "Monaco",
                               "mn" : "Mongolia",
                               "me" : "Montenegro",
                               "ms" : "Montserrat",
                               "ma" : "Morocco",
                               "mz" : "Mozambique",
                               "mm" : "Myanmar",
                               "na" : "Namibia",
                               "nr" : "Nauru",
                               "np" : "Nepal",
                               "nl" : "Netherlands",
                               "nc" : "New Caledonia",
                               "nz" : "New Zealand",
                               "ni" : "Nicaragua",
                               "ne" : "Niger",
                               "ng" : "Nigeria",
                               "nu" : "Niue",
                               "nf" : "Norfolk Island",
                               "mk" : "North Macedonia",
                               "gb-nir" : "Northern Ireland",
                               "mp" : "Northern Mariana Islands",
                               "no" : "Norway",
                               "om" : "Oman",
                               "pk" : "Pakistan",
                               "pw" : "Palau",
                               "ps" : "Palestine",
                               "pa" : "Panama",
                               "pg" : "Papua New Guinea",
                               "py" : "Paraguay",
                               "pe" : "Peru",
                               "ph" : "Philippines",
                               "pn" : "Pitcairn Islands",
                               "pl" : "Poland",
                               "pt" : "Portugal",
                               "pr" : "Puerto Rico",
                               "qa" : "Qatar",
                               "re" : "Réunion",
                               "ro" : "Romania",
                               "ru" : "Russia",
                               "rw" : "Rwanda",
                               "bl" : "Saint Barthélemy",
                               "sh" : "Saint Helena, Ascension and Tristan da Cunha",
                               "kn" : "Saint Kitts and Nevis",
                               "lc" : "Saint Lucia",
                               "mf" : "Saint Martin",
                               "pm" : "Saint Pierre and Miquelon",
                               "vc" : "Saint Vincent and the Grenadines",
                               "ws" : "Samoa",
                               "sm" : "San Marino",
                               "st" : "São Tomé and Príncipe",
                               "sa" : "Saudi Arabia",
                               "gb-sct" : "Scotland",
                               "sn" : "Senegal",
                               "rs" : "Serbia",
                               "sc" : "Seychelles",
                               "sl" : "Sierra Leone",
                               "sg" : "Singapore",
                               "sx" : "Saint Maarten",
                               "sk" : "Slovakia",
                               "si" : "Slovenia",
                               "sb" : "Solomon Islands",
                               "so" : "Somalia",
                               "za" : "South Africa",
                               "gs" : "South Georgia",
                               "ss" : "South Sudan",
                               "es" : "Spain",
                               "lk" : "Sri Lanka",
                               "sd" : "Sudan",
                               "sr" : "Suriname",
                               "sj" : "Svalbard and Jan Mayen",
                               "se" : "Sweden",
                               "ch" : "Switzerland",
                               "sy" : "Syria",
                               "tw" : "Taiwan",
                               "tj" : "Tajikistan",
                               "tz" : "Tanzania",
                               "th" : "Thailand",
                               "tl" : "Timor-Leste",
                               "tg" : "Togo",
                               "tk" : "Tokelau",
                               "to" : "Tonga",
                               "tt" : "Trinidad and Tobago",
                               "tn" : "Tunisia",
                               "tr" : "Turkey",
                               "tm" : "Turkmenistan",
                               "tc" : "Turks and Caicos Islands",
                               "tv" : "Tuvalu",
                               "ug" : "Uganda",
                               "ua" : "Ukraine",
                               "ae" : "United Arab Emirates",
                               "gb" : "United Kingdom",
                               "us" : "United States",
                               "um" : "United States Minor Outlying Islands",
                               "uy" : "Uruguay",
                               "uz" : "Uzbekistan",
                               "vu" : "Vanuatu",
                               "va" : "Vatican City (Holy See)",
                               "ve" : "Venezuela",
                               "vn" : "Vietnam",
                               "vg" : "British Virgin Islands",
                               "vi" : "United States Virgin Islands",
                               "gb-wls" : "Wales",
                               "wf" : "Wallis and Futuna",
                               "eh" : "Western Sahara",
                               "ye" : "Yemen",
                               "zm" : "Zambia",
                               "zw" : "Zimbabwe"
    ]
    

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.secondary)
                        Text(shortToLong[countries[correctAnswer]] ?? "oops")
                            .font(.subheadline.weight(.heavy))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                //.resizable()
                                //.frame(width: 200, height: 100)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                if (highscore != -1) {
                    Text("Highscore: \(highscore)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                }
                
                Spacer()
                
            }
            .padding()
            
        }
        .alert(alertTitle, isPresented: $showingRoundEnd) {
            Button("Play Again", action: newGame)
        } message: {
            if (score > oldHighscore) {
                Text("🎉 New Highscore: \(score) 🎊\nWould you like to play again?")
            } else {
                Text("Final score: \(score)\nWould you like to play again?")
            }
        }
        .alert(alertTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if (tapHandled == false) {
            round += 1
            
            if number == correctAnswer {
                alertTitle = "Correct"
                score += 1
                showingScore = true
                highscore = max(highscore, score)
            } else {
                alertTitle = "Whoops, thats the flag of \(shortToLong[countries[number]] ?? "oops")"
                showingRoundEnd = true
                highscore = max(highscore, score)
            }
            
            tapHandled = true
        }
    }
    
    func newGame() {
        score = 0
        oldHighscore = highscore
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tapHandled = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
