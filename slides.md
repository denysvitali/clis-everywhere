---
theme: ./theme
background: ./pictures/bg-initial.jpg
class: text-center
highlighter: shiki
lineNumbers: false
info:
drawings:
  persist: false
title: CLIs Everywhere
---

# CLIs Everywhere

Denys Vitali -- Data, Analytics & AI Engineer @ Swisscom
---
layout: image-right
background-size: contain
image: ./pictures/denysvitali-gh.png
---
# `whoami`

- Denys Vitali

- ❤️ Open Source, Linux & Reverse Engineering

- ❤️ Creating tools and CLIs

---
layout: image-right-small
background-size: contain
image: ./pictures/denysvitali-swisscom-go.png
---
# About Me @ Swisscom

- Data, Analytics & AI Engineer

- Mostly doing DevOps stuff

- Writing lots of CLIs

- Lots of contributions to Open Source, whenever possible

- Lots of Go


---
layout: cover
background: ./pictures/location.jpg
---

# Thank you Swisscom!

📍 Location

---
layout: fact
background: ./pictures/cli.png
---

# CLIs Everywhere

---
layout: quote
---

# What is a CLI?

<br/>

> A user interface in which the user interacts with the computer through lines of text instead of graphical images.

\- Wikitionary


---
layout: small-title
---

# Examples of CLIs

```bash
$ id
```

```
uid=1000(dvitali) gid=1000(dvitali) groups=1000(dvitali),970(docker),998(wheel)
```

```bash
$ git add .
$ git commit -m "initial commit"
```

```bash
$ curl -s "https://pizza.k8s.best/api/v1/pizzas" | jq .
```
```json
{
  "pizzas": [
    {
        "name": "Pizza Prosciutto",
        "toppings": ["tomato", "mozzarella", "ham"]
    }
  ]
}
```


---
layout: small-title
---

# Why do we need more CLIs?

- Machine readable / processable outputs

- Command concatenation (piping) `|`

- Scripting (e.g: via `bash`)

- To follow the [Unix Principles](https://en.wikipedia.org/wiki/Unix_philosophy#Eric_Raymond's_17_Unix_Rules)
    - "Write simple programs"
    - "Write small programs"
    - "Value developer time over machine time"
    - "Avoid unnecessary output"

---
layout: fact
background: ./pictures/burrito.jpg
---

# `burrito`

---
layout: small-title
---

# Ordering burritos from my SPARC (1992)

Excerpt from the original email

```
Subject: Ordering burritos from my SPARC
From: cjackson@mv.us.adobe.com (Curtis Jackson)
To: tanstaafl@colossus.apple.com
Date: Tue, 08 Sep 92 09:12:20 PDT

There is a little Mexican grocery nearby that has an assembly-line
burrito operation in back. You walk down the line with the person
who is making your burrito, telling them exactly what you want on it.
The problem is that the place is so good and such a good value that
the lines get quite long at times. So La Costena (that's a tilde n)
put in a fax machine and allows you to fax in your orders. Well, we've
gone a quantum leap beyond that with the following.

This is NOT a joke. Ross has taken advantage of the fact that some
PostScript Level 2 printers now have fax capability. Read the whole
doc below when you get a chance -- it represents true burrito decadence!

Curtis
```

[Source](https://web.archive.org/web/20210125000831/http://www.mit.edu/afs.new/sipb/user/marthag/postscript/burritos)


---
layout: small-title
---

# Ordering burritos from my SPARC (1992)

```
Tired of standing in line at La Costena?  This file documents an
automatic facility for sending a fax to La Costena that orders 1 or
more burritos, quesadillas, tacos, and whatever.  The command will
compose the fax, and send it to your favorite PostScript fax printer,
for direct transmission to La Costena, and no paper at this end will
be generated.  Then, when you get there, your food will be waiting.
No worries.

To use this, you will want to add the following lines to your .cshrc
file:

setenv BURRITOPRINTER = <printer>
alias burrito /user/thompson/public/burrito<mach>

<printer> should be the name of a PostScript level 2 printer that
supports fax and is connected to an external phone line. I use

In keeping with long standing Unix tradition, the syntax for
specifying burritos is somewhat obscure. Here is an attempt at
explanation, with some examples at the end.  For a better
understanding, the energetic reader will attempt to thoroughly
comprehend the contents of my .costenarc file.
```

---
layout: small-title
---

# Ordering burritos from my SPARC (1992)

```
burrito [-n "name"] [-t <time>] [-p phone#] [-d] [-x] [FoodSpec [...]]

    -n  specify the name at the top of the order blank.
	   This should be the name of the person who will pick
	   up the order.  Default is current user, as defined in
	   /etc/passwd.
    -t  specify the time at which you will pick up the order.
    	   time may be absolute 24 hour time or +delta. Default is +1:00.
    -p  specify callback number in case La Costena has questions.
	   default is as found in /usr/local/adobe/phones/adobe.phones.
```

---
layout: small-title
---

# Ordering burritos from my SPARC (1992)

```
Up to six FoodSpecs can be specified:
FoodSpec::=<type>[options*][/<name>]
<type> ::= [b|t|m|q|T]
    (burrito, taco, mexico city, quesadilla, Taqitaco)
options:
    +g  gucamole
    +c  cheddar
    +cc cotija
    +cl cilantro
    +cm monterey
    +i"note" special instructions (e.g. black beans, no rice, etc.)
	NOTE: the "s need to be escaped if the shell sees them:
	   +i\"note\"
    +j  whole jalepenos
    +jf fresh jalapenos
    +js sliced jalapenos
    +n:i i copies of this food item. (default = 1)
    +o  olives
    +s  medium salsa
    +sc sour cream
    +sf fire salsa
    +sh hot salsa
```

---
layout: small-title
---

# Ordering burritos from my SPARC (1992)
```
burrito -time +:30 b+g+cc+jf+jf+sf+sc-sc+i"Black Beans"+n:2/Ross \
   b+v:cc+g+cm+sc+i"no rice"/Kathie

interpretation:
logged in user will pick up an order in 30 minutes.
  Ross wants two rice and bean (default) burritos with
    guacamole
    cotija
    fresh jalepenos (double)
    fire salsa
    no sour cream (cancelled)
    Black beans (comment)
  Kathie wants a Chile Colorado burrito with
    guacamole
    montery cheese
    sour cream
    no rice (comment)

```


---
layout: default
---

# Result


- The burrito order only needs textual input

- The process can be extended

- You can now order burritos automatically, thanks to `cron`

<br/>  

```
# Order a Burrito on Monday at 11:45 AM
45 11 * * 1 burrito -time +:30 b+g+cc+jf+jf+sf+sc-sc+n:2/Denys
```

---
layout: cover
background: pictures/swiss-qr-bill.jpg
---

# A more realistic example


---
layout: image-right
background-size: contain
image: ./pictures/paper-stack.jpg
---

## A more realistic example

Let's assume for a second that you're like me:

- You receive lots of mail (postal mail, yes.)

- You mostly care about invoices

- You like to build CLIs

- You have a scanner at home


---
layout: default
---

## Let's build a solution


```mermaid
flowchart LR
    A[Scanner]
    A --> B
    B[CLI 1]
    B --> C
    C[CLI 2]
    C --> D
    D[...]
    OS[OpenSearch]
    Bank[Bank]
    Telegram[Telegram]
    D --> OS
    D --> Bank
    D --> Telegram

```

---
layout: image-right
background-size: contain
image: ./pictures/scanner.jpg
---

# Scanning the documents

Let's see how we can scan our documents:

<ul>
<li v-click>
<a href="https://github.com/stapelberg/airscan"><code>stapelberg/airscan</code></a>
</li>

<li v-click>
<code>airscan1 -host=scanner-1 -source=adf</code> *
</li>

<li v-click>
<pre>
./page1.jpg
./page2.jpg
./page3.jpg
</pre>
</li>
</ul>

<small v-click>* ADF = Automatic Document Feeder</small>

---
layout: image-right
background-size: contain
image: ./pictures/invoice-example.jpg
---

# Result

- A set of JPG images
  - Some might be blank [1]
  - Some contain a QR code (QR-Bill) [2]
  - Most of them contain text [3]


---
layout: image-right
background-size: contain
image: ./pictures/blankpage-detector.jpg
---

# Some might be blank...

```
$ blank-page-detector images/page*.jpg
images/page1.jpg
images/page4.jpg

$ rm $(blank-page-detector images/page*.jpg)
```

---
layout: image-right
background-size: contain
image: ./pictures/zbar-webpage.jpg
---

# Some contain a QR code

zbarimg - scan and decode bar codes from image file(s)

```
$ zbarimg -q page1.jpg
QR-Code:SPC
0200
1
CH3489144137632279546
S
Denys Vitali
Example
1
8600
Zurich
CH

10.81
CHF

NON
Please Don't Send Money to a random IBAN
EPD
```

---
layout: small-title
---

# Write a parser

<img src="/pictures/go-swiss-qr-bill.jpg" style="height: 400px;margin-left:auto; margin-right: auto;">

---
layout: small-title
---

# Use the CLI you've just created

```
swiss-qr-bill < qrbill.txt
```

```json
{
  "Header": {
    "QRType": "SPC",
    "Version": {
      "Major": 2,
      "Minor": 0
    },
    "CodingType": 1
  },
  "CreditorInformation": {
    "IBAN": "CH3489144137632279546"
  },
  "Creditor": {
    "Name": "Denys Vitali",
    "StrtNmOrAdrLine1": "Example",
    "BldgNbOrAdrLine2": "1",
    "PostalCode": "8600",
    "Town": "Zurich",
    "CountryCode": "CH"
    // ...
   }
}
```

---
layout: small-title
---

# Pipe it to `jq`

Perform whatever check you need via jq, for example:

- discard bills that don't have your name on it
- don't automatically pay stuff over 500 CHF
- ...

<br/>

```
$ swiss-qr-bill | jq .PaymentAmount.Amount.Base
10
```


---
layout: image-right
background-size: contain
image: ./pictures/ocr-scan.jpg
---

# Some contain text

```
tesseract -l eng+deu page1.jpg /tmp/result
```
<br/>

<pre style="font-size: 10px; padding: 4px;">
WIKIPEDIA

The Free Encyclopedia

Optical character recognition

A process called Optical Character Recognition
(OCR) converts printed texts into digital image files. It
is a digital copier that uses automation to convert
scanned documents into editable, shareable PDFs that
are machine-readable. OCR may be seen in action
when you use your computer to scan a receipt. The
scan is then saved as a picture on your computer. The
words in the image cannot be searched, edited, or Farly —ÜZZÄI““""_“ e i

counted, but you may use OCR to convert the image A e T 0230
to a text document with the content stored as text.
OCR software can extract data from scanned
documents, camera photos, and image-only PDFs. It
makes static material editable and does away with the

necessity for human data entry.[!]

Video of the process of scanning and real-
time optical character recognition (OCR)
with a portable scanner
</pre>

---
layout: image-right
background-size: contain
image: ./pictures/image-stcks-and-iphone-racks.jpg
---

# Improving OCR quality

Inspiration: [Image Stacks and iPhone Racks - Building an Internet Scale Meme Search Engine (2023)](https://findthatmeme.com/blog/2023/01/08/image-stacks-and-iphone-racks-building-an-internet-scale-meme-search-engine-Qzrz7V6T.html)


<div v-click>
TL;DR:
<img src="/pictures/iphone-cluster.jpg" width="300" style="margin-top: 10px;"/>
</div>

---
layout: small-title
---

# First OCR attempt

<img src="/pictures/iphone-8.jpg"/>

<div v-click style="margin-top: 2em">
... ended up not using it at all.
</div>

<div v-click style="margin-top: 2em">
(does anyone need an iPhone 8?)
</div>


---
layout: small-title
---

# Send a (Telegram) notification

You can as well send a notification during the process

```bash
function telegram_notify(){
    BOT_TOKEN="$1"
    CHAT_ID="$2"
    TEXT="$3"

    curl \
        -s \
        -X POST
        "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=$TEXT" 
}
```

---
layout: small-title
---

# Send the payment to you bank

TODO: Create your own CLI here

<div v-click>
... or extend mine

<img 
    src="/pictures/postfinance-sync.jpg" 
    style="height: 400px; width: 400px; margin-left: auto; margin-right: auto; object-fit: cover;"
/>

</div>


---
layout: small-title
---

# Blueprint of your bash script

```bash
export TELEGRAM_TOKEN=token
export TELEGRAM_CHAT_ID=-1

function process(){
    QR_CODE=$1
    JSON=$(echo "$QR_CODE" | swiss-qr-bill)
    AMOUNT=$(echo "$JSON" | jq -r ".PaymentAmount.Amount.Base")

    if [ $AMOUNT -gt 500 ]; then
        echo "Skipping, $AMOUNT > 500 CHF..."
    else
        telegram-notify "$TELEGRAM_TOKEN" "$TELEGRAM_CHAT_ID" "Amount: $AMOUNT"
        pf-cli pay "$QR_CODE"
    fi
}

airscan1 -host=scanner-1 -source=adf

for i in *.jpg; do
    QR_CODE=$(zbarimg "$i" | sed -s 's/QR-Code://g')
    process "$QR_CODE"
done
```

    
---
layout: code-slide
---

# Life Before Generics

<ReplitEditor :path="'@denysvitali/go-generics-example-1'" :file="'main.go'" />

---
layout: cover
background: https://media4.giphy.com/media/SXS950PdvjSfu9bCpV/giphy.gif?cid=ecf05e471g13n4a6cbb8qr0l50zmr2usi9czi22aexc27w30&rid=giphy.gif&ct=g
---

# Q&A

---
layout: default
---

# Thank you!

<div class="social-info">
<img 
  src="https://pbs.twimg.com/profile_images/1441455322455949319/_0xwiskP_400x400.jpg" 
  class="profile-picture"
  />
<div class="links">
  <h3>Denys Vitali</h3>
  <div class="icon-values">
    <IconValue icon="icon-twitter">
      <a href="https://twitter.com/DenysVitali">@DenysVitali</a>
    </IconValue>
    <IconValue icon="icon-linkedin">
      <a href="https://www.linkedin.com/in/denysvitali/">/in/denysvitali</a>
    </IconValue>
    <IconValue icon="icon-laptop-internet">
      <a href="https://denv.it">https://denv.it</a>
    </IconValue>
  </div>
</div>
</div>

<style>
  div.social-info {
    display: flex;
    margin-top: 2em;
    flex-direction: row;
    justify-content: space-around;
    column-gap: 2rem;
  }

  div.social-info a {
    color: #FFF;
  }

  div.icon-values {
    display: flex;
    flex-direction: column;
    row-gap: 10px;
  }

  span.icon-text {
    line-height: 20px;
  }

  img.profile-picture {
    border-radius: 150px; 
    height: 150px;
  }
</style>
