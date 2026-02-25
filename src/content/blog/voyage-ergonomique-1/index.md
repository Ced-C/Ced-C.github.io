+++
title = "Voyage Ergonomique : Errances & Typographie"
date = 2026-02-24
draft = false
[taxonomies]
tags = ["clavier", "linux"]
[extra]
toc = false
display_published = true 
author = "Cætera"
+++

Je suis tombé dans le terrier de lapin de l’ergonomie clavier en 2023.  
J’avais un peu de temps et je me suis dit que c’était un bon investissement que de me lancer dans l’apprentissage de la **dactylographie**. Le but, c’était de gagner du temps en tapant, mais aussi du confort.  
À l’époque, je tapais à 2 ou 4 doigts, sur un clavier ANSI, mais je savais que je pouvais faire mieux :

{{ img(id="1vs10_fingers.jpeg", alt="Un meme : on voit un clavier avec chaque touche assigée à un doigt grâce à un système de couleur, puis, moi, avec un doigt multicolor", caption="La méthode « hunt&peck » que j’utilisais")}}

Ce que je ne savais pas à l’époque, c’est que c’est un monde fascinant, encore en évolution, où la science n’a pas encore tout tranché.

À l’époque, je tapais en **Qwerty-international**, et je ne comprenais pas pourquoi tout le monde ne faisait pas de même. Après tout, c’était _pratique_, surtout comparé à l’Azerty :  
- les chiffres étaient en accès direct ;  
- les symboles courants en programmation étaient mieux placés (`{ } | ' `) ;  
- les accents français se faisaient via des touches mortes (`" ' \``) pour le tréma, l’accent aigu et l’accent grave.  

C’était pratique en _hunt & peck_. Surtout c’était présent sur tous les ordinateurs par défaut, et suffisamment proche d’Azerty pour que je puisse taper ainsi même sur un clavier marqué Azerty.

Ah, l’innocence !

Aujourd’hui, je me demande comment on peut se servir de cette disposition au quotidien.  
La différence ? La dactylographie. En apprenant à se servir de ses 9 ou 10 doigts pour taper, les contraintes changent complètement.

{{ gif(path="miguel-as-de-la-jungle.mp4")}}

Le Départ : Qwenty International
---
J’avais donc décidé de me lancer dans l’apprentissage de la dactylo.  
C’est d’abord très éprouvant mentalement. Même en se cantonnant à 5 à 15 minutes par jour, je sortais de session sans énergie mentale. Apprendre à utiliser ses 9 doigts et à les coordonner est étonnamment fatigant — adulte, on n’apprend plus aussi vite, ni aussi bien. Puis, on est crispé, on commence donc à ressentir de petites tensions et douleurs dans les mains.

Enfin, ça devient plus fluide. Je dépasse péniblement les 25 mpm, mais quelque chose cloche : je ne trouve pas Qwerty très confortable, même en anglais. Et je n’étais encore qu’aux exercices en anglais, sans tous les accents et diacritiques français. Plus j’avançais, pire c’était :

- j’avais l’impression que mon index et mon majeur passaient beaucoup trop de temps sur la ligne du haut ;  
- mon auriculaire droit commençait à souffrir, très sollicité pour les `M` et les diacritiques `´ ˝` ;  
- les accents graves étaient loin à aller chercher, trop loin.  

Je me suis dit qu’après tout, cela ne faisait qu’une semaine que je travaillais la disposition : je pouvais encore changer.  
Mais changer pour quoi ? Je me suis mis à la recherche d’une disposition optimisée pour le français, puisque c’était le principal défaut que je trouvais à Qwerty-international. Un défaut impossible à voir tant qu’on est en _hunt & peck_ : toutes les touches se valent, et les auriculaires sont peu sollicités.

La dactylographie, c’est très pratique : les mots apparaissent à l’écran quand on y pense, on peut se concentrer sur ce qu’on écrit plutôt que sur l’action de taper. Mais ça pousse aussi à s’éloigner de la norme. Impossible de rester en Qwerty pour ma part (et Azerty est largement pire).  
J’ai alors écumé le web à la recherche de mieux…

### TL;DR Qwerty-international

- La dactylographie rend la position des touches critique.  
- Les touches excentrées surchargent les auriculaires.  
- 5 à 15 min/jour suffisent pour acquérir des bases en ~2 semaines.  
- Qwerty-international est peu confortable et très asymétrique.


Bépo : Un progrès arrivé 100 ans trop tard.
---

…Et je suis retombé sur [Bépo][bepo], dont j’avais entendu parler lors de sa certification AFNOR.  
Quelque part, c’était rassurant : la disposition a été réfléchie. Elle est pensée pour le français ; avec Bépo, je ne pouvais pas me tromper ! Je me lance.

Je n’avais pas bien compris qu’en dactylo, on n’a plus besoin de regarder les touches. On tape en aveugle ; mon critère de « suffisamment proche d’Azerty » devenait caduque. Tant mieux, ça me laissait plus de liberté. Je voulais cependant rester sur un clavier « classique » : pas envie d’être perdu ailleurs, ni de voyager avec un clavier dans un sac déjà trop rempli.

Bépo était déroutant au début, mais très plaisant : on peut vite faire des mots, voire des phrases, sur la ligne de repos (_home row_). C’est très agréable en français. Je passe d’un clavier ANSI à un clavier ISO quand je remarque que la touche supplémentaire permet de taper directement `Ê` : pratique.  

<details>
<summary>
Je découvre avec joie l’accès à des caractères supplémentaires pour une bonne typographie
</summary>

### Digression typographique

J’apprends que, pour faire bien, il faut utiliser l’apostrophe typographique <code style="font-size:1.2em;">’</code> plutôt que l’apostrophe droite <code style="font-size:1.2em;">&apos;</code>, qui sert surtout en programmation.  
Soit. C’est vrai que visuellement, ça fait mieux. Ça fait « comme dans les livres ».

J’apprends aussi qu’on dit *une* espace <kbd>␣</kbd> et qu’il en existe plusieurs sortes : la classique entre les mots, mais aussi l’insécable et l’insécable fine.  
Pourquoi ? En français, on met *une espace* avant certains caractères comme `? ! « » ; : €`.

Avec une espace classique, on risque d’avoir un caractère orphelin en début de ligne suivante :

```txt
On ne veut pas de ça
!
---
On veut ça !
```
Les espaces insécables garantissent que ça n’arrive pas.

La différence entre l’insécable et l’insécable fine, c’est simplement la largeur : la fine est plus… fine. Je trouve que ça se rapproche davantage de l’écriture manuscrite, donc je privilégie l’insécable fine avant les unités et les ponctuations doubles.

</details>

L’avantage de Bépo, c’est que certains symboles typographiques sont présents de base et placés de façon logique. Mais cela éloigne certains caractères fréquents en programmation (`# $ %`). Ce n’est pas dramatique pour moi, n’étant pas développeur de métier, mais ça se ressent tout de même.

### Entraînement à la dactylographie

Très vite, l’entraînement devient addictif.  
En deux semaines, je connais tout le clavier par cœur, à 25 mpm : lent et frustrant.  
En un mois, je passe 40 mpm : suffisant pour travailler, mais en dessous de ma vitesse de base (~55 mpm en recopie, ~70 mpm en dictée).  
En deux mois, je suis à 60–70 mpm : lune de miel.

Mais tout n’est pas parfait : ` Ç Z W ` sont loin, mais rares en français. Hein, hein ?

Non.

En démarrant un nouvel emploi, où je dois communiquer presque exclusivement en anglais, le problème est immédiat. Bépo a été conçu pour le français, et ça se voit. Taper l’anglais, notamment les `wh`, est très pénible —et fréquent.

C’est frustrant. J’avais trouvé une disposition acceptable en français, mais c’est pénible pour le code et quasiment inutilisable en anglais.  
En somme, Bépo est arrivé 100 ans trop tard, il aurait fait le bonheur des dactylographes sur machine à écrire : que du français, pas de code. 

### TL;DR Bépo

- Pas mal pour le français.  
- Symboles de programmation parfois éloignés.  
- Mauvais compromis pour l’anglais moderne.  

---

## Conclusion après deux mois de dactyloraphie

Après deux mois de dactylographie, j’avais appris à taper à 9 doigts, mais je ne savais plus quelle disposition utiliser ; Qwerty était universel mais inconfortable, Bépo améliorait le français au dépans du reste. 
Je me retrouvais dans un entre-deux frustrant : trop engagé pour revenir en arrière, pas totalement satisfait pour continuer.

Je ne pouvais pas être le seul francophone à taper en anglais et à coder.

En cherchant, je suis tombé sur une petite communauté qui se posait exactement les mêmes questions —[Ergo-L][ergol].

C’est là que les choses sont devenues vraiment intéressantes.

[bepo]: https://bepo.fr
[ergol]: https://ergol.org



