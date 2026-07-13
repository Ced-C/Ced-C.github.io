+++
title = "SuperProductivity | Le super pouvoir de suivre son temps"
date = 2026-05-20
draft = false
[taxonomies]
tags = ["FOSS", "SuperProductivity"]
[extra]
comment_id = "116911792838733259"
toc = false
display_published = true 
author = "Cætera"
+++

Pour la première fois de ma carrière je suis fliqué. Oui avec les GAFAMs qui en
font leur business, ça devrait être une habitude, mais au taff, je n’avais
jamais fait ça : je doit remplir des feuilles de temps. 
Je ne suis ni le premier, ni le dernier, mais pour le faire bien… Ce n’est pas 
si simple ! Arrivé à la fin de la semaine, se souvenir de façon correcte de
combien de temps on a passé sur chaque sujet tout au long de la semaines… bonne
chance. 

Il y a pas mal façon de faire, mais ni le pipo, ni la demi-journée pour
retrouver ce que j’ai fait ne me convenait.
Je suis donc parti d’un logiciel de _todo_ que j’utilisais de temps en temps
pour en faire un outil de réapropriation de mon temps. 

Bref, j’avais un outil _overkill_ pour ce que j’en faisais, maintenant j’ai une
gestion du temps _overkill_ pour mon quotidien. Mais c’est pas plus mal, et
surtout, c’est complètement adapté à mon besoin et à ce que je veux savoir de
moi.

Cet outil, c’est [Super Productivity][sp], un logiciel libre qui fait plusieurs
choses :
- _todo_ liste
- gestion du temps passé
- pomodoro pour ceux que ça interesse
- gestion des habitudes, des pauses, &c.

Bon on va pas se mentir, c’est un peu long comme nom, et j’ai pas envie de le 
tapper trop de fois ; on va arranger ça :
```python
import superproductivity as sp
```
voilà, sp, c’est pas très parlant, mais c’est plus court !

Sp, c’est un véritable couteau suisse pour gérer son temps si tant est qu’on prenne
la peine de s’en servir. Bon, en général, un couteau suisse… je m’en méfie !
C’est souvent un outil qui fait pleins de choses mais qui n’en fait aucune bien
ou de façon efficace. C’est pour ça que j’ai toujours été proche
philosophiquement de l’esprit UNIX : faire une choses, et la faire bien.

Ensuite on assemble des briques unitaires ensemble de façon cohérente. 
Mais… sur ce coup, j’ai peut-être trouvé une exception. Une façon, si besoin il
y avait, de confirmer mon côté français —pas de règle sans exception. 

Un logiciel pensé pour le clavier
---------------------------------
La première chose que j’ai apprécié en utilisant sp, c’est que c’est un outil
qui est pensé pour une utilisation au clavier. On peut faire facilement les
actions de bases grace à des raccourcis _à la vim_, c’est à dire sans _modifier_ 
(<kbd>Ctrl</kbd>, <kbd>Alt</kbd>, <kbd>⊞ Win</kbd>) : Tapper `W` (**w**ork)
vous arriver dans la liste des tâche planifié aujourd’hui ; tapper `⇑ A`, (**a**dd)
vous ajoutez une tache. C’est ainsi pour la majorité des actions accessible dans
la GUI, le tout en navigant entre les tâches avec `hjkl`.

{{gif(path="/img/chefs-kiss-french-chef.mp4")}}

Tout ces racourcis sont bien sûr personnalisable, mais j’ai appris à aimer les
paramètres par défaut des logiciels, je n’y ait donc pas touché (si ce n’est le
raccourcis globale pour mettre la fenêtre en avant `⊞ Alt S` pour que ça soit plus
« logique » par rapport aux autres raccourcis globaux que je peux avoir).

Outre ces raccourcis, le logiciel est vraiment pensé pour les gens qui utilisent
les GUIs comme ceux qui préfèrent la ligne de commande. Un format _shortcodes_
est utilisable pour tapper ses tâches au clavier.

Imaginez, vous voulez ajouter une tache « préparer diapo kickoff » pour le
projet « tartempion » et vous estimez que ça va mettre 2h de travail que vous
voulez tagger comme #prez pour voir le temps que vous passez par semaine à
pisser du ppt ? 
Eh bien plutôt que de dérouler plusieurs menu dans l’interface, il suffit de
faire `⇑A` puis de tapper :
```txt
préparer diapos kickoff +tarte 2h #prez
```

Le logiciel comprendra même si « tartempion » n’est pas tappé en entier et associe
le  `+` à un projet, le `#` à une étiquette, et parse les `2h` pour en faire une 
estimation du temps de sorte qu’il est possible de mettre face à face l’estimation
des temps par rapport à ceux réalisés. 

Passé de simple _todo_ à un compagnon de gestion de mon temps, je me suis
ensuite intéressé à l’aspect planification pour gérer _quand_ je ferais
mes tâches et la durée de mes journée ; maintenant, j’ai des tâches récurrentes
qui (re-)viennent, et je commence à lorgner sur les fonctionnalités autours des
habitudes. 

C’est devenu le premier logiciel que j’ouvre le matin avec mon agenda afin de
planifier la journée quand je ne le fait pas à la semaine —et il me permet 
d’avoir une vision assez fidèle de ce que je fais de mon temps.


Suivre son temps
----------------
J’ai vu qu’avec la fonctionnalité sauvegarde automatique, toutes les données de
sp sont sauvegardées dans des fichiers `JSON` qui permettent ensuite d’exploiter 
ces données comme bon nous semble. 

Je ne voulais pas passer trop de temps sur le sujet et donc au lieu de contribuer
au logiciel et d’y ajouter les vues qui me paraissaient pertinentes, j’ai
réalisé un petit script python pour exporter les données de sp et les mettre en 
forme dans un dashboard sommaire (grace à la bibliothèque [plotly], et à [quarto]
que je teste depuis quelques mois).
C’est aussi ça de vieillir, on ne veux plus trop passer de temps sur
à peu près tout ce qui nous parait pas primordial, quitte à mal faire les choses.

Plotly c’est chouette, ça propose des graph interactifs sur lesquels ont peu
afficher plus de détail. C’est la bibliothèque que j’avais déjà utilisée dans
mon article [voyage ergonomique : À deux touches du bonheur](@/blog/voyage-ergonomique-3/index.md)
pour voir la progression de ma vitesse de frappe.

Dans un premier temps, je me suis concentrer sur reproduire les _analytics_ de 
la boite, définis comme projet, afin d’être sûr de ne pas compter deux fois mon
temps. 

Ensuite j’ai commencé à créer quelques tags mais c’est là que les choses risquent
de bouger à l’avenir. Je m’en sert pour le moment pour différencier le type
d’activité que j’ai :
- administration
- management
- réunion (interne, externe)
- opérationnel
- pause (très important !)
- &c.

C’est sommaire, mais ça me permet en un coup d’œil de faire le reporting 
demandé, mais d’avoir certaines informations en plus, et notamment le temps 
que je passe en réunion toute les semaines. 
Oui, comme beaucoup, ma boite aime bien organiser des réunions. 

Globalement ça ressemble à çà :
<iframe
  id="dashboard"
  title="Dashboard – 2026-W27"
  width="100%"
  height="500em"
  src="dashboard.html"></iframe>

Pas ma semaine la plus productive vous en conviendrez, mais il faut aussi
retenir que _tous les temps ne sont pas enregistrés_ notamment une bonne 
partie des imprévues. C’est donc plutôt une borne basse qu’une vérité 
absolue. 

En y regardant de plus près, vous pourrez y voir différents onglets,
chacun tentent de se focaliser sur une ou plusieurs questions :

1. Remplir mes feuille de temps 
2. Passé-je trop de temps en réunion
3. Quelle est ma motivation ; suis-je entrain de me désengager avec trop de pauses ?
4. Qu’est-ce qui me prend plus de temps et d’énergie en ce moment ?
5. Estimé-je bien le temps qu’il me faut pour réaliser mes tâches ?

Les réponses sont là, encore faut-il prendre le temps de regarder les résultats. 

### Mes remarques sur mon temps

Globalement, je me rend compte que je ne suis pas trop surpris. 

👉 Je passes 20 % de mon temps en réunion ce qui reste raisonnable —pour le moment. 
👉 Je passes peut-être pas assez de temps sur mon projet principal en ce moment,
mais je sais que c’est aussi parcequ’il y a peu de ressources de disponible et
que tout seul je ne peux pas faire grand chose. 
👉 J’ai passé bien plus te temps de pause _au début_ de mon arrivée dans
l’entreprise ; je devais apprendre à connaître les gens avec qui j’allais être 
ammené à travailler. C’est maintenant chose faite, cette quantité s’est naturellement
réduite de moitié. 
👉 Je me suis amélioré dans l’estimation du temps nécessaire à la réalisation des
tâches longues que j’avais systématiquement tendance à sous-estimer. 

Cet exercice a donc été utile pour en apprendre plus sur moi et mon mode de 
fonctionnement. 

Conclusion
----------
Ce qui est sûr, c’est que mesurer son temps ne rend pas forcément plus productif ;
mais ça rend beaucoup plus difficile de se mentir.

Je pense être arrivé à un point d’équilibre ; travailler plus sur ce tableau de
bord serait un prétexte pour ne pas faire mon vrai travail —mais maintenant 
que je le mesure difficile de procrastiner. 

Cette solution me permet de voir l’essentiel, mes temps que je dois reporter,
certes, mais aussi quelle est la dynamique dans laquelles je suis : augmentation
ou baisse des temps de pauses, de travail, sur quel projets, etc. 
Si la vue par semaine est essentielle pour remplir mes feuille de temps, je
trouve la vue mensuelle que j’ai crée dans la foulée plus pertinente —elle apporte
un éclairage sur les tendances pour moins de temps, passé à regarder. 

Ça me permet de me poser ensuite les bonnes question sur ce que je veux faire de
ma vie au travail.



[sp]: https://super-productivity.com/
[plotly]: https://plotly.com/
[quarto]: https://quarto.org/
