+++
title = "Typst : Un latex moderne – Faire une lettre avec en-tête SVG configurable"
date = 2026-01-03
draft = false
[taxonomies]
tags = ["typst", "FOSS", "tuto", "documentation"]
[extra]
toc = false
display_published = true 
author = "Cætera"
comment_id = "115886235885263672"
+++




Vous connaissez **LaTeX** ?  
_(non, ce n’est pas NSFW, et oui, ça se prononce « La-Tek »)_

Moi oui.  
Et j’en garde des séquelles.

J’ai **une** expérience sérieuse avec LaTeX : la rédaction de mon mémoire.  
Une aventure humaine. Une épreuve initiatique. Une erreur de jeunesse.

Déjà, mon tuteur était contre —j’aurais dû l’écouter.  
Ensuite, soyons honnêtes : ce n’était **pas pratique**.

Certes, _tout_ est configurable…  
Mais à quel prix ?

Dès qu’on tente de personnaliser un peu le doc, la courbe d’apprentissage devient un mur d’escalade, sans prises.  
J’avais repris le modèle de l’université sans vraiment comprendre comment il fonctionnait (et je suspecte secrètement ceux qui arrivent à lire et comprendre ces templates de venir d’une autre planète).  
Et surtout, plus mon mémoire avançait, plus **la compilation prenait une éternité**.

Bref, à la fin, je me suis dit :  
> « Plus jamais. »

Et j’ai tourné la page…


Le format texte
---

Il y avait _un truc_ que j’aimais particulièrement dans LaTeX : **le format texte**.

Un document stocké en texte, ça veut dire :
- qu’on peut l’écrire dans **l’éditeur de son choix** ;
- qu’on peut le **versionner avec git** ;
- qu’on peut utiliser **tout l’outillage du texte** (regex, scripts, automatisation) ;
- qu’on peut se concentrer (en grande partie) sur le **fond**, et gérer la forme à part.

Sur le papier, c’est magnifique.  
En pratique… le jeu n’en valait pas la chandelle. À y repenser, je crois simplement que je n’étais pas la cible.

Je me suis retranché sur _markdown_ dès que je l’ai rencontré. 
Il avait presque toutes les propriétés que je cherchais :
- le texte brut,
- la simplicité,
- la portabilité,

sans la lourdeur de latex et de tout son outillage. J’utilise du Markdown (avec les _vim motions_) pour tout ou presque :
- mes notes (dans [Obsidian](@/blog/organiser-sa-vie-avec-md/index.md)),
- des mails un peu longs,
- des brouillons de documents, quitte à finir plus tard dans une autre app, une  fois envoyé aux hérétique ne sachant pas utilser un clavier, mais je m’égare ;
- des articles de blog (oui, comme celui-ci).


Typst, le latex moderne, écrit en Rust
---

Et puis un jour, j’ai vu passer [Typst][typst]. J’ai regardé [la vidéo du camarade Patrick Massot][video_typst], et là je me suis dit :

> « …pourquoi pas ? »

Typst se présente comme une sorte de **LaTeX moderne** :
- syntaxe plus simple, proche du markdown,
- compilation _ultra rapide_,
- un seul binaire, et un gestionaire de paquet intégré, bienvenu au XXIᵉ siècle,
- pensé pour évoluer au-delà du PDF, notamment avec un effort pour supporté le format web.

Je regardais de loin le travail du projet [paged.js][paged] pour son objectif de faire avancer les technologies web et les rendre compatibles avec l’impression ; et donc pouvoir avoir une source unique qui s’adapte au support : téléphone, tablette, écran, papier A4. Je suis ravis que Typst travail également activement sur la question !

Le langage est suffisamment proche de markdown pour qu’une simple note puisse devenir, progressivement, un vrai document structuré si besoin. 
Pas besoin de savoir _a priori_ quel sera le document final et d’y réfléchir. Pas besoin de choisir entre simplicité et puissance. 

> Alors… on essaie ?

### Faire une lettre avec en-tête SVG paramétrable
Je suis en pleine recherche d’emploi.

Mon CV est fait avec Inkscape (l’équivalent libre d’Illustrator), ce qui me donne un contrôle total sur la mise en forme.  
Mais…

- On me conseille souvent d’adapter le **titre du CV** selon le poste.
- Je change parfois mon alias **d’adresse email** pour cloisoner mes usages
- Il m’arrive même d’utiliser une **adresse différente**, (quand j’ai de la famille proche) selon la localisation pour augmenter mes chances de succès. 

Résultat :
1. je modifie le SVG à la main (ou via des scripts) sur le CV,  
2. j’exporte en PDF (inkscape _headless_ ❣️),
3. j’ouvre inkscape pour copier l’en-tête dans libre office (et une fois sur deux, j’ai des marges blanches d’un pixel qui me dérangent),
4. je rédige ma lettre dans un logiciel avec la syntaxe vim,
5. je colle le tout dans libre office. 

Ce n’est pas (très) long. Mais c’est **chiant**, et il y a un peu de frixion quand même. 

Je me suis demandé si Typst ne pouvait pas simplifier mon _workflow_ notamment sur la lettre de motivation. 

On va donc recréer mon en-tête avec Typst, en rendant les champs **paramétrables** et **scriptables**.

On part de cette en-tête :

![En-tête de CV](entete.svg)

Pour produire un **PDF propre**.


#### Importer des paquets (et ne pas pleurer)

À la grande différence de LaTeX, Typst utilise un gestionnaire de paquets _centralisé_.  
Et ça, c’est franchement agréable.

Ici, on a besoin de pouvoir injecter du texte dans une chaîne, un peu comme les _fstring_ en python, ou la macro `format!()` en rust.

On utilise donc le paquet `oxifmt`.

```typst
#import "@preview/oxifmt:1.0.0": strfmt

// ==== Variables ====
#let name = "Et Cætera"
#let address = "123 Example Street, 00000, Utopie"
#let phone = "+0 123 456 789"
#let email = "hire.me@simplelogin.com"
#let position_title = "C3PO"
#let reference_number = "2026-newGalaxy"
```

#### Modifier dynamiquement le SVG
On importe ensuite le SVG et on remplace les champs à la volée :
```typst
#let svg_header = strfmt(
  read("entete.svg"),
  name: name,
  address: address,
  phone: phone,
  position_title: position_title,
  email: email,
)
```

#### Définir le document et l’en-tête
On configure ensuite les métadonnées, la page, les marges et l’en-tête :
```typst
#set document(
  title: name + " — Lettre de Motivation",
  author: name,
)

#let page_width = 210mm
#set page(
  paper: "a4",
  margin: (top: 46mm, bottom: 20mm, x: 10mm),
  header-ascent: 0%,
  header: [
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
```
Afficher proprement l’en-tête, c’est la partie sur laquelle j’ai le plus tâtonné.
Idéalement, j’aimerais une fonction qui calcule automatiquement la hauteur de l’en-tête de façon dynamique, de sorte à ne
mettre aucune valeur fixe, mais je n’ai pas trouvé. 
Si vous savez faire mieux : écrivez-moi [sur Mastodon][contact].

#### Rédaction
```typst
#set text(font: "Arial", size: 12pt)
#set par(justify: true)

#text(strong("Objet") + " : Candidature au poste " + position_title + " – Ref. " + reference_number)

Madame, Monsieur,

#lorem(120)
#lorem(130)
#lorem(100)

Bien cordialement,

#text(name)
```

J’ai mis trois paragraphes remplis par la fonction `lorem` ici pour comblé, mais c’est là qu’on rédige avec une syntaxe proche de markdown.

#### Compilation
Une fois la lettre rédigée, on génère le PDF en « compilant » [notre fichier typst](test.typ) (`.typ`).
```bash
typst compile test.typ
```
✨Et pouf✨ [un PDF propre](test.pdf), cohérent, automatisable.

Je peux maintenant arrêter de procrastiner et écrire mes lettres de motivations, Typst ne fait pas (encore) ça.


[typst]:https://typst.app/
[paged]:https://www.pagedjs.org/
[video_typst]:https://videos.capitoledulibre.org/w/ckhaJabpYLZTcMGBnaQoHU
[contact]:https://diaspodon.fr/@CedC
